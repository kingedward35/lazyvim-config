return {
  "folke/todo-comments.nvim",
  keys = { { "<leader>st", false } },
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup({})
  end,
}
