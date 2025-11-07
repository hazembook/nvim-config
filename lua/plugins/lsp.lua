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
      vim.lsp.config.pyright = {
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      }

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
      vim.lsp.enable("ruff")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("texlab")
      vim.lsp.enable("tinymist")
      vim.lsp.enable("zls")

      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
