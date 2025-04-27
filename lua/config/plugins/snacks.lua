return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      zen = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
    },

    config = function ()
      local snacks = require("snacks")
      local map = vim.keymap.set

      -- Zen mode
      map("n", "<space>zz", snacks.zen.zen)
      map("n", "<space>zf", snacks.zen.zoom)

      -- Git & Lazygit
      map("n", "<space>gg", snacks.lazygit.open)
      map("n", "<space>gl", snacks.lazygit.log)
      map("n", "<space>gf", snacks.lazygit.log_file)

    end
  }
}
