return {
  "m4xshen/hardtime.nvim",
  event = "BufEnter",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  -- opts = {},
  opts = function(_, opts)
    -- make sure the default table exists
    -- opts.restricted_keys = opts.restricted_keys or {}
    -- do NOT restrict gj / gk
    -- opts.restricted_keys["gj"] = false
    -- opts.restricted_keys["gk"] = false
    opts.showmode = false
    opts.max_count = 12
  end,
}
