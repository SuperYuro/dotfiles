local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    sources = cmp.config.sources{
        { name = "nvim_lsp" },
        -- { name = "buffer" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})
