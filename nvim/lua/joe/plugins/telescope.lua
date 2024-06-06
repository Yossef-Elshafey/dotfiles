return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
		vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>") -- find input
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>") -- find under cursor
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
		-- nothing with telescope just some buffer jumping
		vim.api.nvim_set_keymap("n", "<C-o>", ":bnext<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-i>", ":bprev<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-x>", ":bdelete<CR>", { noremap = true, silent = true })
	end,
}
