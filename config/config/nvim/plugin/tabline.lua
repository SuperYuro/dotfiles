-- Tabline: one label per tab with the file icon and file name

local M = {}

---@param tabnr integer
---@param selected boolean
---@return string
local function label(tabnr, selected)
  local buflist = vim.fn.tabpagebuflist(tabnr)
  local buf = buflist[vim.fn.tabpagewinnr(tabnr)]

  local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
  if name == "" then
    name = "[No Name]"
  end

  local ok, devicons = pcall(require, "nvim-web-devicons")
  local icon = ok and devicons.get_icon(name, nil, { default = true }) or ""

  -- Label text is not evaluated as statusline items, so escape "%"
  local text = string.format(" %s %s ", icon, name):gsub("%%", "%%%%")
  local hl = selected and "%#TabLineSel#" or "%#TabLine#"

  -- %{tabnr}T makes the label clickable
  return hl .. "%" .. tabnr .. "T" .. text
end

function M.render()
  local labels = {}
  local current = vim.fn.tabpagenr()
  for tabnr = 1, vim.fn.tabpagenr("$") do
    labels[#labels + 1] = label(tabnr, tabnr == current)
  end
  return table.concat(labels) .. "%#TabLineFill#%T"
end

-- Register as a module so that the tabline expression can call it
package.loaded["SuperYuro.tabline"] = M

vim.o.showtabline = 2 -- Always show the tabline
vim.o.tabline = "%!v:lua.require'SuperYuro.tabline'.render()"
