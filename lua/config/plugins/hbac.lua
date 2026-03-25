return {
  {
    'axkirillov/hbac.nvim',
    dependencies = {
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      require("hbac").setup({
        autoclose = true,
        threshold = 6
      })

      require('telescope').load_extension('hbac')
    end
  }
}
