return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require('bufferline')
      bufferline.setup {
        options = {
          separator_style = "slope"
        },
      }

      vim.keymap.set("n", "gb", bufferline.pick)
    end
  }
}
