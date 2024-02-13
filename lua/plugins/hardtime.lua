return {
  "m4xshen/hardtime.nvim",
  event = "BufEnter",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  -- opts = {},
  config = function()
    require("hardtime").setup({ showmode = false })
  end,
}
