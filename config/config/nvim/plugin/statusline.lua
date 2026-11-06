-- Statusline: git branch, file name with breadcrumbs and LSP status

local M = {}

-- Git branch in a bold accent color (returns statusline items, so "%" is escaped)
function M.branch()
  local head = vim.b.gitsigns_head
  if not head or head == "" then
    return " "
  end
  return " %#StatusLineBranch#[ " .. head:gsub("%%", "%%%%") .. " ]%* "
end

local function set_highlights()
  local palette = require("catppuccin.palettes").get_palette("latte")
  vim.api.nvim_set_hl(0, "StatusLineBranch", { fg = palette.mauve, bold = true })
end

-- Symbol path at the cursor (from aerial.nvim)
function M.breadcrumbs()
  if not package.loaded["aerial"] then
    return ""
  end
  local names = {}
  for _, symbol in ipairs(require("aerial").get_location(true)) do
    names[#names + 1] = symbol.icon .. symbol.name
  end
  return #names > 0 and (" › " .. table.concat(names, " › ")) or ""
end

-- Latest LSP progress message per client
local progress = {}

-- Language servers attached to the current buffer (with progress while loading)
function M.lsp_status()
  local items = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    items[#items + 1] = progress[client.id] or client.name
  end
  return #items > 0 and ("[" .. table.concat(items, " | ") .. "] ") or ""
end

local group = vim.api.nvim_create_augroup("statusline", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = set_highlights })
set_highlights()

vim.api.nvim_create_autocmd("LspProgress", {
  group = group,
  callback = function(ev)
    local value = ev.data.params.value
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if type(value) ~= "table" or not client then
      return
    end

    if value.kind == "end" then
      progress[client.id] = nil
    else
      local parts = { client.name .. ":", value.title, value.message }
      if value.percentage then
        parts[#parts + 1] = string.format("(%d%%)", value.percentage)
      end
      progress[client.id] = table.concat(vim.tbl_filter(function(p) return p ~= nil and p ~= "" end, parts), " ")
    end
    vim.cmd.redrawstatus()
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  group = group,
  command = "redrawstatus",
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  command = "redrawstatus",
})

vim.api.nvim_create_autocmd("LspDetach", {
  group = group,
  callback = function(ev)
    progress[ev.data.client_id] = nil
    -- The detaching client is still listed until this event finishes
    vim.schedule(function() vim.cmd.redrawstatus() end)
  end,
})

-- Register as a module so that the statusline expression can call these functions
package.loaded["SuperYuro.statusline"] = M

local sl = "v:lua.require'SuperYuro.statusline'"
vim.o.statusline = "%{%" .. sl .. ".branch()%}%<%f%{" .. sl .. ".breadcrumbs()} %=%{" .. sl .. ".lsp_status()}"
