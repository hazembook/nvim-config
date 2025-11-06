return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "yousefhadder/markdown-plus.nvim",
    ft = "markdown", -- Load on markdown files by default
    config = function()
      require("markdown-plus").setup({
        -- Configuration options (all optional)
        enabled = true,
        features = {
          list_management = true, -- List management features
          text_formatting = true, -- Text formatting features
          headers_toc = true,     -- Headers + TOC features
          links = true,           -- Link management features
          quotes = true,          -- Blockquote toggling feature
          code_block = true,      -- Code block conversion feature
          table = true,           -- Table support features
        },
        keymaps = {
          enabled = true, -- Enable default keymaps (<Plug> available for custom)
        },
        toc = {           -- TOC window configuration
          initial_depth = 2,
        },
        table = { -- Table sub-configuration
          auto_format = true,
          default_alignment = "left",
          keymaps = { enabled = true, prefix = "<leader>t" },
        },
        filetypes = { "markdown" }, -- Filetypes to enable the plugin for
      })
    end,
  },
}
