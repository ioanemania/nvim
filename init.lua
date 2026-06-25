vim.g.diffs = {
  integrations = {
    neogit = true,
    neojj = true,
    gitsigns = true,
    telescope = true,
  },
}

require("config.lazy")

if vim.g.neovide then
  vim.g.neovide_opacity = 0.7
  vim.g.neovide_normal_opacity = 0.7
  vim.g.neovide_window_blurred = true
  vim.o.guifont = "Iosevka Big 27:h18"
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Make Telescope transparent
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = 'none' })
    
    -- Optional: If using other floating windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
  end,
})


vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'
vim.opt.cursorline = true
vim.opt.winborder = "rounded"
vim.opt.fillchars:append { eob = " " }
vim.opt.wrap = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

local map = vim.keymap.set
map("n", "<space><space>x", "<cmd>source %<cr>")
map("n", "<space>x", ":.lua<cr>")
map("v", "<space>x", ":lua<cr>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<C-n>", "<cmd>cnext<cr>")
map("n", "<C-p>", "<cmd>cprev<cr>")

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'lua', 'rust' },
  callback = function() vim.treesitter.start() end,
})

vim.cmd("colorscheme gruvbox")
