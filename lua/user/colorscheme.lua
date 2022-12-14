local colorscheme = "catppuccin"

local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status_ok then
	return
end

catppuccin.setup({
  flavour = "frappe",
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
