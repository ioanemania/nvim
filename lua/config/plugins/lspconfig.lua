local lsp_servers = { "lua_ls", "ts_ls", "tinymist", "clangd", "zls", "ty" }

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = lsp_servers,
      })
    end,
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
      "saghen/blink.cmp",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local lspconfig = vim.lsp.config
      local servers = lsp_servers

      for _, server in ipairs(servers) do
        lspconfig(server, {
          capabilities = require("blink.cmp").get_lsp_capabilities(),
        })
        vim.lsp.enable(server)
      end

      -- GODOT LSP
      lspconfig("godotdev", {
        editor_host = "127.0.0.1",      -- Godot editor host
        editor_port = 6005,             -- Godot LSP port
        debug_port = 6006,              -- Godot debugger port
        autostart_editor_server = true, -- Enable auto start Nvim server
      })

      local telescope_builtin = require("telescope.builtin")

      local map = vim.keymap.set

      map("n", "<space>lf", vim.lsp.buf.format)
      map("v", "<space>lf", vim.lsp.buf.format)
      map("n", "gd", telescope_builtin.lsp_definitions)
      map("n", "gD", vim.lsp.buf.declaration)
      map("n", "<leader>gi", vim.lsp.buf.implementation)
      map("n", "grr", telescope_builtin.lsp_references)
      map("n", "<space>fs", telescope_builtin.lsp_dynamic_workspace_symbols)
      map("n", "<space>fd", telescope_builtin.lsp_document_symbols)
      map("n", "<space>df", vim.diagnostic.open_float)
      map("n", "<space>dl", telescope_builtin.diagnostics)
      map("n", "<space>dq", vim.diagnostic.setqflist)
    end,
  },
}
