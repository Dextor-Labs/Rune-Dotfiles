--which-key.lua
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      win = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>b", group = "Buffers" },
        { "<leader>n", group = "Search" },
        { "<leader>d", group = "Diagnostics" },
        { "<leader>t", group = "Terminal" },
      })
    end,
  },
}