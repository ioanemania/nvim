require("config.lazy")

if vim.g.neovide then
  vim.g.neovide_opacity = 0.7
  vim.g.neovide_normal_opacity = 0.7
  vim.g.neovide_window_blurred = true
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
