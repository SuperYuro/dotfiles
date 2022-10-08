local status, mason = pcall(require, 'mason')
if (not status) then return end
local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}
lspconfig.setup {
  ensure_installed = {
    'arduino_language_server',
    'bashls',
    'clangd',
    'cmake',
    'cssls',
    'cssmodules_ls',
    'dockerls',
    'html',
    'jsonls',
    'tsserver',
    'texlab',
    'sumneko_lua',
    'marksman',
    'pylsp',
    'rust_analyzer',
    'taplo',
    'tailwindcss',
    'vimls',
  }
}
