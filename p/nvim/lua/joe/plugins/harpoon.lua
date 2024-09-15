return {
	"ThePrimeagen/harpoon",
	config = function()
		vim.keymap.set("n", "<leader>hw", "<cmd>lua require('harpoon.mark').add_file()<CR>")
		vim.keymap.set("n", "<leader>hq", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")

		global_settings = {
			save_on_toggle = false,
			save_on_change = true,
			enter_on_sendcmd = false,
			tmux_autoclose_windows = false,
			excluded_filetypes = { "harpoon" },
			mark_branch = false,
			tabline = false,
			tabline_prefix = "   ",
			tabline_suffix = "   ",
		}
	end,
}
