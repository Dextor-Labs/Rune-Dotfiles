return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
          "bash",
          "markdown",
          "markdown_inline",
          "rust",
          "go",
          "gomod",
          "gowork",
          "gosum",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}