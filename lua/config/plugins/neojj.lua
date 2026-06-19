return {
  {
    "NicholasZolton/neojj",
    version = "^1.0.0", -- recommended: track 1.x releases (see Versioning below)
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required

      -- Only one of these is needed.
      "sindrets/diffview.nvim",   -- optional
      "esmuellert/codediff.nvim", -- optional

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "nvim-mini/mini.pick",           -- optional
      "folke/snacks.nvim",             -- optional
    },
    cmd = "Neojj",
    keys = {
      { "<leader>jj", "<cmd>Neojj<cr>", desc = "Show Neojj UI" },
    },
  },
}
