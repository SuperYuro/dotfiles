local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'css',
        'dart',
        'dockerfile',
        'fish',
        'html',
        'http',
        'java',
        'javascript',
        'json',
        'json5',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'ruby',
        'rust',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
    },
    autotag = {
        enable = true,
    },
}
