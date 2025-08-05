require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = vim.opt.fillchars + 'diff:╱'
vim.opt.cursorline = true

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
