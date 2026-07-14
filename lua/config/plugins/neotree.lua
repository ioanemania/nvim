return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself

    config = function()
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(arg)
              vim.cmd([[setlocal number]])
              vim.cmd([[setlocal relativenumber]])
            end,
          },
        },
      })
      vim.keymap.set("n", "<leader>n", ":Neotree action=show position=left toggle<CR>")
      vim.keymap.set("n", "<leader>gs", ":Neotree source=git_status position=float toggle<CR>")
      vim.keymap.set("n", "<leader>bb", ":Neotree source=buffers position=float toggle<CR>")
    end,
  },
}
