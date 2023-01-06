local status, mason = pcall(require, "mason")
if not status then
    return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
            -- package_installed = "I",
            -- package_pending = ">",
            -- package_uninstalled = "x",
        },
    },
})
lspconfig.setup({
    ensure_installed = {
        "pyright",
        "sumneko_lua",
    },
    automatic_installation = true,
})

vim.keymap.set("n", "gis", ":LspInstall<Return>", { silent = true })
