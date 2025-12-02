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
            { desc = "Find File", key = "f", action = "Telescope find_files cwd="}
          }
        }
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }
}
