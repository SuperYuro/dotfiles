return {
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        menu = {
          auto_show = true,
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },
        range = "full",
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
        ghost_text = {
          enabled = true,
          show_with_menu = true,
        },
      },
      fuzzy = {
        implementation = "rust",
        sorts = {
          "score",
          "exact",
        },
      },
      keymap = {
        preset = "super-tab",
      },
      sources = {
        default = { "lsp", "snippets", "buffer" },
        per_filetype = {
          lua = { "lazydev", "lsp", "snippets", "buffer" },
          bash = { "buffer", "path" },
          sh = { "buffer", "path" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      cmdline = {
        keymap = {
          preset = "super-tab",
        },
        completion = {
          ghost_text = {
            enabled = false,
          },
          menu = {
            auto_show = true,
          },
        },
      },
    },
  },
}
