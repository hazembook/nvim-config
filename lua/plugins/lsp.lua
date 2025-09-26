return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function(_)
      vim.lsp.enable("bashls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("denols")
      vim.lsp.enable("gopls")
      vim.lsp.enable("harper_ls")
      vim.lsp.enable("herb_ls")
      vim.lsp.enable("html")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("rubocop")
      vim.lsp.enable("ruby_lsp")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("texlab")
      vim.lsp.enable("tinymist")
      vim.lsp.enable("zls")
    end,
  },
}
