return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },

      { "<s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "aserowy/tmux.nvim",
    lazy = false,
    config = function()
      require("tmux").setup()
    end,
    keys = {
      { "<C-h>", "<cmd>lua require('tmux').move_left()<cr>" },
      { "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>" },
      { "<C-k>", "<cmd>lua require('tmux').move_top()<cr>" },
      { "<C-l>", "<cmd>lua require('tmux').move_right()<cr>" },
    },
  },
}
