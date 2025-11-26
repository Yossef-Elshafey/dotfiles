local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
vim.opt.showtabline = 0

opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")
opt.scrolloff = 10
opt.swapfile = false
opt.backup = false

opt.undodir = ".vim/undotree"
opt.undofile = true

opt.colorcolumn = "90"
vim.o.background = "dark"

vim.o.laststatus = 0

-- floating window bg
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#222222" }) -- Float windows black
	end,
})

-- preserve folds for buffers
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})
