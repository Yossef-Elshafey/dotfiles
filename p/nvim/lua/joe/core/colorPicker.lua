local function colorPicker()
	local colors = {
		"PaperColor",
		"ayu-dark",
		"ayu-light",
		"catppuccin-macchiato",
		"catppuccin-mocha",
		"github_dark_colorblind",
		"github_dark_default",
		"github_dark_high_contrast",
		"github_dark_tritanopia",
		"gruvbox",
		"melange",
	}
	for index, color in ipairs(colors) do
		print(index, color)
	end

	local color = tonumber(vim.fn.input("Choose color: "))
	local colorname = colors[color]
	local cmd = "colorscheme" .. " " .. colorname
	vim.cmd(cmd)
end

vim.api.nvim_create_user_command("ColorPicker", colorPicker, { nargs = 0, desc = "Set Colorscheme" })
