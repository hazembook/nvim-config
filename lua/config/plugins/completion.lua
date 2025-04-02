return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',

  version = '1.*',

  opts = {
    keymap = {
      preset = 'default',

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },

      ['<Tab>'] = { 'accept', 'fallback' },
    },

    appearance = { nerd_font_variant = 'mono' },

    signature = { enabled = true },

    completion = { documentation = { auto_show = true } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
