vim.g.mapleader = " "
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", "<C-w><", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", "<C-w>>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>hl", vim.cmd.noh)
vim.keymap.set("n", "<A-o>", ":normal o <CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
-- WARN: Cliboard seperated or no later on
vim.keymap.set("v", "<c-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t]", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<leader>tq", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.disable()<CR>")
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.enable()<CR>")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.api.nvim_set_keymap("n", "<C-o>", ":bnext<CR>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-i>", ":bprev<CR>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", ":bdelete<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("W", "w", {})

-- floating window bg
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#010409" })
	end,
})
