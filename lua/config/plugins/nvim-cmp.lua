return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
    },

    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append("c")

      require("lspkind").init {}

      local cmp = require("cmp")

      cmp.setup {
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        },

        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm { behavior = cmp.SelectBehavior.Insert, select = true },
            { "i", "c" }
          ),
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        },
      }
    end
  }
}
