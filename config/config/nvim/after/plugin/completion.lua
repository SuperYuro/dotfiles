require("blink.cmp").setup({
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    menu = {
      auto_show = true,
    },
    keyword = {
      range = "full",
    },
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
})
