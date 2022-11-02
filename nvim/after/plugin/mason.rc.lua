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
        'sumneko_lua',
        'pylsp',
        'rust_analyzer',
    },
    automatic_installation = true
}

vim.keymap.set('n', 'gis', ':LspInstall<Return>', { silent = true })
