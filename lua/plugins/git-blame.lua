return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = false,
    message_template = "  <author> • <date> • <summary> • <<sha>>",
    date_format = "%Y-%m-%d",
    virtual_text_column = 1,
  },
  -- keys = {
  --   { "<leader>gt", "<cmd>GitBlameToggle<cr>", desc = "Toggle blame information" },
  --   { "<leader>GB", "<cmd>GitBlameOpenFileURL<cr>", desc = "Open blame in browser" },
  -- },
}
