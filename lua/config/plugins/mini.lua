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
      require('mini.bufremove').setup {}

      require('mini.diff').setup {
        view = { style = 'sign' }
      }

      local gen_loader = require('mini.snippets').gen_loader
      require('mini.snippets').setup {
        gen_loader.from_lang(),
      }

      vim.keymap.set("n", "<space>go", ":lua MiniDiff.toggle_overlay()<cr>")
      vim.keymap.set("n", "<space>bd", ":lua MiniBufremove.delete()<cr>")
    end
  },
}
