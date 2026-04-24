--[=[--vim.g.mapleader = " "

local keymap = vim.keymap

-- File explorer
--keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Telescope
--keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
--keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })

-- Save & Quite
--keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })

--Clear search highlight
--keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
-- diagnostics keymaps
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
]=]

-- lua/dexters_laboratory/core/keymaps.lua

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- =========
-- File Explorer
-- =========
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", vim.tbl_extend("force", opts, {
  desc = "Explorer: Toggle",
}))

-- =========
-- Find / Telescope
-- =========
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", vim.tbl_extend("force", opts, {
  desc = "Find: Files",
}))

keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", vim.tbl_extend("force", opts, {
  desc = "Find: Grep",
}))

keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", vim.tbl_extend("force", opts, {
  desc = "Find: Buffers",
}))

keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", vim.tbl_extend("force", opts, {
  desc = "Find: Help",
}))

keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", vim.tbl_extend("force", opts, {
  desc = "Find: Recent files",
}))

-- =========
-- File actions
-- =========
keymap.set("n", "<leader>w", "<cmd>w<CR>", vim.tbl_extend("force", opts, {
  desc = "File: Save",
}))

keymap.set("n", "<leader>q", "<cmd>q<CR>", vim.tbl_extend("force", opts, {
  desc = "File: Quit",
}))

-- =========
-- Buffers
-- =========
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", vim.tbl_extend("force", opts, {
  desc = "Buffer: Next",
}))

keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", vim.tbl_extend("force", opts, {
  desc = "Buffer: Previous",
}))

keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", vim.tbl_extend("force", opts, {
  desc = "Buffer: Delete",
}))

-- =========
-- Windows
-- =========
keymap.set("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, {
  desc = "Window: Move left",
}))

keymap.set("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, {
  desc = "Window: Move right",
}))

keymap.set("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, {
  desc = "Window: Move down",
}))

keymap.set("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, {
  desc = "Window: Move up",
}))

-- =========
-- Diagnostics / LSP
-- =========
keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, {
  desc = "Diagnostics: Line",
}))

keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, {
  desc = "Diagnostics: Previous",
}))

keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, {
  desc = "Diagnostics: Next",
}))

-- =========
-- Search
-- =========
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", vim.tbl_extend("force", opts, {
  desc = "Search: Clear highlight",
}))

-- =========
-- Terminal
-- =========
keymap.set("n", "<leader>t", "<cmd>terminal<CR>", vim.tbl_extend("force", opts, {
  desc = "Terminal: Open",
}))

-- =========
-- Visual mode helpers
-- =========
keymap.set("v", "<", "<gv", vim.tbl_extend("force", opts, {
  desc = "Indent left",
}))

keymap.set("v", ">", ">gv", vim.tbl_extend("force", opts, {
  desc = "Indent right",
}))