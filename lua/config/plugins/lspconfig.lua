local lsp_servers = { "lua_ls", "ts_ls", "tinymist", "clangd", "zls", "ty" }

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = lsp_servers
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      'saghen/blink.cmp',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local lspconfig = vim.lsp.config
      local servers = lsp_servers

      for _, server in ipairs(servers) do
        lspconfig(server, {
          capabilities = require('blink.cmp').get_lsp_capabilities()
        })
      end

      lspconfig("gdscript", {
        name = "godot",
        cmd = vim.lsp.rpc.connect("127.0.0.1", 6005)
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end
          if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = 'LSP: Disable hover capability from Ruff',
      })

      local telescope_builtin = require("telescope.builtin")

      local map = vim.keymap.set

      map("n", "<space>lf", vim.lsp.buf.format)
      map("v", "<space>lf", vim.lsp.buf.format)
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "gD", vim.lsp.buf.declaration)
      map("n", "<leader>gi", vim.lsp.buf.implementation)
      map("n", "gr", vim.lsp.buf.references)
      map("n", "<space>fs", telescope_builtin.lsp_dynamic_workspace_symbols)
      map("n", "<space>fd", telescope_builtin.lsp_document_symbols)
      map("n", "<space>df", vim.diagnostic.open_float)
      map("n", "<space>dl", telescope_builtin.diagnostics)
      map("n", "<space>dq", vim.diagnostic.setqflist)
    end,
  },
}
