-- Basic settings
--vim.opt.number = true
--vim.opt.mouse = "a"
--vim.opt.tabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
--vim.opt.termguicolors = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "dexters_laboratory.plugins" }
})

-- Plugins
--require("lazy").setup({
  -- File explorer
  --"nvim-tree/nvim-tree.lua",

  -- Status line
  --"nvim-lualine/lualine.nvim",

  -- Syntax highlighting
  --{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Icons (for explorer/statusline)
  --"nvim-tree/nvim-web-devicons",

  -- Autocomplete
  --"hrsh7th/nvim-cmp",
  --"hrsh7th/cmp-nvim-lsp",
  --"neovim/nvim-lspconfig",

  -- Colorscheme
  --"folke/tokyonight.nvim",
--})

-- Setup lualine
--require("lualine").setup()


-- Setup nvim-tree
--require("nvim-tree").setup()

-- Colorscheme
--vim.cmd.colorscheme("tokyonight")
