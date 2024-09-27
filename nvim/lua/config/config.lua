vim.opt.guicursor = {
  "n-v-c:block",     -- Normal, Visual, and Command-line mode: block cursor
  "i:ver25",         -- Insert mode: vertical bar cursor (ver25 means a 25% wide vertical bar)
  "r-cr:hor20",      -- Replace and Command-line Replace mode: horizontal bar cursor
  "o:hor50",         -- Operator-pending mode: horizontal bar cursor (50% wide)
}

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.opt.cursorline = true


