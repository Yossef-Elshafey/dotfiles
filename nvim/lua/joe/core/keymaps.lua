vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", "<cmd>Explore<CR>")
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
-- WARN: clipoard still needs some configs either seperate them or not
vim.keymap.set("v", "<c-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tq", "<cmd>tabNext<CR>")
vim.keymap.set("n", "<leader>t]", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.disable()<CR>")
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.enable()<CR>")

vim.api.nvim_create_user_command("W", "w", {})
