local function colorPicker()
	local colors = {
		"PaperColor",
		"ayu-dark",
		"ayu-light",
		"catppuccin-macchiato",
		"catppuccin-mocha",
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
