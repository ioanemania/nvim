return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'MunifTanjim/nui.nvim'
    },

    config = function()
      local themes = require('telescope.themes')
      local actions = require('telescope.actions')

      require('telescope').setup {
        defaults = themes.get_dropdown({
          border = true,
          previewer = false,

          layout_config = {
            height = 0.6,
            width = 0.6,
          },

          prompt_prefix = ">> ",
          selection_caret = ">> ",

          mappings = {
            i = {
              ["<C-j>"] = {
                actions.move_selection_next, type = "action",
                opts = { nowait = true, silent = true }
              },
              ["<C-k>"] = {
                actions.move_selection_previous, type = "action",
                opts = { nowait = true, silent = true }
              },
            }
          },
        }),

        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<space>ff", function() require('telescope.builtin').find_files({previewer = false, disable_devicons = true}) end)
      vim.keymap.set("n", "<space>fg", require('telescope.builtin').live_grep)
      vim.keymap.set("n", "<space>fh", function() require('telescope.builtin').help_tags({previewer = false}) end)
      vim.keymap.set("n", "<space>fb", function() require('telescope.builtin').buffers({previewer = false}) end)
      vim.keymap.set("n", "<space>fw", function() require('telescope.builtin').grep_string() end)
      vim.keymap.set("v", "<space>fw", function() require('telescope.builtin').grep_string() end)
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath("config"), previewer = false }
      end)

      vim.keymap.set("n", "<space>gc", function() require('telescope.builtin').git_branches({previewer = false}) end)
    end,
  },
}
