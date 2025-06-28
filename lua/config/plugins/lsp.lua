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
    opts = {
      servers = {
        bashls = {},
        clangd = {},
        denols = {},
        gopls = {},
        html = {},
        lua_ls = {},
        pyright = {},
        rubocop = {},
        ruby_lsp = {},
        rust_analyzer = {},
        texlab = {},
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "never",
          },
        },
        zls = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

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

          local keymap_opts = { buffer = args.buf }

          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, keymap_opts)
          vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, keymap_opts)
          vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, keymap_opts)
          vim.keymap.set("n", "<leader>vf", function() vim.diagnostic.open_float() end, keymap_opts)
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, keymap_opts)
          vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, keymap_opts)
          vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, keymap_opts)
          vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, keymap_opts)
        end,
      })
    end,
  },
}