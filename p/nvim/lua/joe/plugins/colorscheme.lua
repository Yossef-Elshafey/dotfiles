return {
	"Mofiqul/vscode.nvim",
	config = function()
		vim.o.background = "light"

		local c = require("vscode.colors").get_colors()
		require("vscode").setup({
			transparent = true,

			-- Enable italic comment
			italic_comments = true,

			-- Disable nvim-tree background color
			disable_nvimtree_bg = true,

			-- Override colors (see ./lua/vscode/colors.lua)
			color_overrides = {
				vscLineNumber = "#FFFFFF",
			},

			group_overrides = {
				Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
			},
		})
		require("vscode").load("dark")
	end,
}
