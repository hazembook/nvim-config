return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = '*',

    opts = {
      keymap = {
        preset = 'default',

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },

        ['<Tab>'] = { 'accept', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      signature = { enabled = true },

      completion = {
        documentation = { auto_show = true }
      },
    },
  },
}
