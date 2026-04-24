--vim.cmd("let g:netrw_liststyle = 3")

-- Basic settings
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- Advance
vim.opt.scrolloff = 8
--vim.opt.relativenumber = true


-- Better splites 
vim.opt.splitright = true
vim.opt.splitbelow = true


-- newtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- timeout faster nvim SPACE key LEADER 
vim.o.timeout = true
vim.o.timeoutlen = 300 -- faster
vim.o.updatetime = 200