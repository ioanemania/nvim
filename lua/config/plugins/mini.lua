return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      require('mini.notify').setup {}
      require('mini.pairs').setup {}
      require('mini.starter').setup {}
      require('mini.surround').setup {}
      require('mini.trailspace').setup {}
      require('mini.comment').setup {}

      require('mini.diff').setup {
        view = { style = 'sign' }
      }

      vim.keymap.set("n", "<space>go", ":lua MiniDiff.toggle_overlay()<cr>")
    end
  },
}
