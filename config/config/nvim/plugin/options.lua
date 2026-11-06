vim.opt.fileencoding = "utf-8"

vim.wo.number = true
vim.wo.relativenumber = true

-- vim.opt.mouse = ""

vim.opt.shell = vim.fn.has("win32") == 1 and "pwsh" or "fish"

vim.opt.title = true
vim.opt.backup = false
vim.opt.cmdheight = 0

-- Built-in message and cmdline UI (experimental in 0.12).
-- Messages go to a small window that disappears after a few seconds,
-- so nothing waits for "Press ENTER" with cmdheight = 0. Use g< to see full output.
require("vim._core.ui2").enable({
  msg = {
    targets = "msg",
  },
})

-- Rounded border for floating windows (LSP hover, signature help, diagnostics, ...)
vim.o.winborder = "rounded"
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.updatetime = 200 -- Delay for CursorHold (used by LSP reference highlight)
vim.opt.backupskip = "/etc/*,/usr/bin/*,/usr/share/*,/usr/src/*"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true -- Smart indent
vim.opt.wrap = true -- Wrap lines
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*", "*/venv/*", "*/.venv/*" })

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Highlight settings
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "light"

-- Disable netrw (telescope-file-browser is used instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Show which-key popup quickly
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Global statusline (see plugin/statusline.lua)
vim.opt.laststatus = 3
