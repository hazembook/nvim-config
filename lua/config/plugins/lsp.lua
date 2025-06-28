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
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require("lspconfig").bashls.setup { capabilities = capabilities }
      require("lspconfig").clangd.setup { capabilities = capabilities }
      require("lspconfig").denols.setup { capabilities = capabilities }
      require("lspconfig").gopls.setup { capabilities = capabilities }
      require("lspconfig").html.setup { capabilities = capabilities }
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").pyright.setup { capabilities = capabilities }
      require("lspconfig").rubocop.setup { capabilities = capabilities }
      require("lspconfig").ruby_lsp.setup { capabilities = capabilities }
      require("lspconfig").rust_analyzer.setup { capabilities = capabilities }
      require("lspconfig").texlab.setup { capabilities = capabilities }
      require("lspconfig").tinymist.setup {
        capabilities = capabilities,
        settings = {
          formatterMode = "typstyle",
          exportPdf = "never",
        }
      }
      require("lspconfig").zls.setup { capabilites = capabilities }

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if c:supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end

          local opts = { buffer = args.buf }

          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
          vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>vf", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end,
      })
    end,
  }
}
