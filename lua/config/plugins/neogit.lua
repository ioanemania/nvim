return {
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    config = function()
      local neogit = require("neogit")
      local map = vim.keymap.set

      map("n", "<leader>gg", neogit.open, {desc = "Open Neogit UI"})
      map("n", "<leader>gl", function() neogit.open({ "log" , kind="floating"}) end, {desc = "Open Neogit UI"})
    end
  }
}
