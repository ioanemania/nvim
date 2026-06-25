return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.notify').setup {}
      require('mini.pairs').setup {}
      require('mini.surround').setup {}
      require('mini.trailspace').setup {}
      require('mini.comment').setup {}
      require('mini.bufremove').setup {}

      local gen_loader = require('mini.snippets').gen_loader
      require('mini.snippets').setup {
        gen_loader.from_lang(),
      }

      vim.keymap.set("n", "<space>bd", ":lua MiniBufremove.delete()<cr>")
    end
  },
}
