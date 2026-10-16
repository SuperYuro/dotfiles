return {
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    opts = {
      hide = {
        cursorline = true,
        focused_win = false,
        only_win = false,
      },
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 1 },
        overlap = {
          winbar = true,
        },
      },
      render = function(props)
        local icons = require("utils.icons")
        local devicons = require("nvim-web-devicons")
        local palette = require("catppuccin.palettes").get_palette("latte")

        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, _ = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        local bg = props.focused and palette.blue or palette.base
        local fg = props.focused and palette.base or palette.subtext0

        local function get_git_diff()
          local signs = vim.b[props.buf].gitsigns_status_dict
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons.diff) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { " " .. icon .. signs[name], group = "Diff" .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { " " })
          end
          return labels
        end

        local function get_diagnostic_label()
          local label = {}

          for severity, icon in pairs(icons.diagnostics) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { " " .. icon .. n, group = "DiagnosticSign" .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { " " })
          end
          return label
        end

        return {
          { get_diagnostic_label() },
          { get_git_diff() },
          { " ", ft_icon, " ", filename, " ", guifg = fg, guibg = bg, gui = modified and "bold,italic" or "bold" },
        }
      end,
    },
  },
}
