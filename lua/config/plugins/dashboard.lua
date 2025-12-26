return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          vertical_center = true,
          center = {
            { desc = "Find File", key = "f", action = "Telescope find_files cwd="},
            { desc = "Find Text", key = "g", action = "Telescope live_grep"}
          }
        }
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }
}
