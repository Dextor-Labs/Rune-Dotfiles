-- autocmds go here later

local autocmd = vim.api.nvim_create_autocmd
-- 1. Highlight text after yanking
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})