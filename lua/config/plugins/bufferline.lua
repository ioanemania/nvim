return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require('bufferline')
      bufferline.setup {
          options = {
              mode = "tabs", -- set to "tabs" to only show tabpages instead
          }
      }

      -- vim.keymap.set("n", "<leader>br", bufferline.rename_tab)
      vim.keymap.set("n", "gb", bufferline.pick)
    end
  }
}
