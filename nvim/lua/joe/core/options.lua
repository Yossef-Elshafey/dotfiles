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
