return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				separator_style = "slope",
				diagnostics = "nvim_lsp",
				max_name_length = 14,
			},
		})
		vim.keymap.set("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>")
	end,
}
