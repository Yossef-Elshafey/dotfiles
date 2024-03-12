return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-\>]],
			direction = "float",
			start_in_insert = true,
			float_opts = {
				border = "curved",
			},
		})
		vim.keymap.set("n", "<A-1>", function()
			vim.cmd(":ToggleTerm dir=~/Desktop direction=horizontal name=desktop")
		end)
	end,
}
