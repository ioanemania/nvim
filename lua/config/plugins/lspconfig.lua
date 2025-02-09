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
        ensure_installed = { "lua_ls", "pyright", "svelte", "glslls", "zls" }
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
    },
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "pyright", "svelte", "glslls", "zls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup {
            capabilities = require('blink.cmp').get_lsp_capabilities()
        }
      end

      vim.keymap.set("n", "<space>lf", function() vim.lsp.buf.format() end)
    end,
  },
}
