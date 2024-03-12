vim.g.mapleader = " "

vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w><", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "<C-w>>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>hl", vim.cmd.noh)
-- blank line under cursor while keeping me in normal mode
vim.keymap.set("n", "<A-o>", ":normal o <CR>", {noremap=true, silent=true})
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
-- integrates with xclip
vim.keymap.set("v", "<c-c>", '"+y', { noremap = true, silent = true })
