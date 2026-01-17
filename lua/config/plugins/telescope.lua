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
        defaults = themes.get_ivy({

          layout_config = {
            height = 20,
          },

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

      vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<space>fg", require('telescope.builtin').live_grep)
      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<space>fb", require('telescope.builtin').buffers)
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath("config") }
      end)
    end,
  },
}
