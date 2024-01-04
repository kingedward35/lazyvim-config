return {
  "folke/todo-comments.nvim",
  event = "LazyFile",
  keys = { { "<leader>st", false } },
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup({})
  end,
}
