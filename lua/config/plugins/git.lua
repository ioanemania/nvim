return {
  {
    "barrettruth/diffs.nvim",
    lazy = false,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  {
    "NicholasZolton/neojj",
    version = "^1.0.0", -- recommended: track 1.x releases (see Versioning below)
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "esmuellert/codediff.nvim",      -- optional
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neojj",
    keys = {
      { "<leader>jj", "<cmd>Neojj<cr>", desc = "Show Neojj UI" },
    },
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    config = function()
      local neogit = require("neogit")
      local map = vim.keymap.set

      map("n", "<leader>gg", neogit.open, { desc = "Open Neogit UI" })
      map("n", "<leader>gl", function()
        neogit.open({ "log", kind = "floating" })
      end, { desc = "Open Neogit UI" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        signs = {
          add = { text = "▎" },
          change = { text = "░" },
          delete = { text = "_" },
          topdelete = { text = "▔" },
          changedelete = { text = "▒" },
          untracked = { text = "┆" },
        },
        on_attach = function(bufnr)
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "]h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]h", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[h", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          map("n", "<leader>hs", gitsigns.stage_hunk)
          map("n", "<leader>hr", gitsigns.reset_hunk)

          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)

          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)

          map("n", "<leader>hp", gitsigns.preview_hunk)
          map("n", "<leader>go", gitsigns.preview_hunk_inline)

          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end)

          map("n", "<leader>hd", gitsigns.diffthis)
        end,
      })
    end,
  },
}
