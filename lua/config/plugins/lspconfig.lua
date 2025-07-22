local lsp_servers = { "lua_ls", "svelte", "glslls", "gopls", "rust_analyzer", "pyrefly", "ts_ls", "tinymist", "clangd" }

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
      local lspconfig = require("lspconfig")
      local servers = lsp_servers

      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          capabilities = require('blink.cmp').get_lsp_capabilities()
        }
      end

      local telescope_builtin = require("telescope.builtin")

      local map = vim.keymap.set

      map("n", "<space>lf", function() vim.lsp.buf.format() end)
      map("n", "gd", telescope_builtin.lsp_definitions)
      map("n", "gr", telescope_builtin.lsp_references)
      map("n", "<space>fs", telescope_builtin.lsp_workspace_symbols)
      map("n", "<space>df", vim.diagnostic.open_float)
      map("n", "<space>dl", telescope_builtin.diagnostics)
      map("n", "<space>dq", vim.diagnostic.setqflist)
    end,
  },
}
