return {
	"ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<C-s>", "<cmd>lua require('harpoon.mark').add_file()<CR>")
		vim.keymap.set("n", "<C-k>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
		vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
		vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
		vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
		vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
		vim.keymap.set("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>")

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
