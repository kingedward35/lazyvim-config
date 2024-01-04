return {
  "dmmulroy/tsc.nvim",
  event = "VeryLazy",
  config = function()
    local utils = require("tsc.utils")
    require("tsc").setup({
      auto_open_qflist = false,
      auto_close_qflist = false,
      auto_focus_qflist = false,
      auto_start_watch_mode = false,
      -- bin_path = utils.find_tsc_bin(),
      bin_path = "/usr/local/lib/node_modules/typescript/bin/tsc",
      enable_progress_notifications = true,
      flags = {
        noEmit = true,
        -- project = false,
        -- project = function()
        --   return vim.fn.findfile("tsconfig.json")
        -- end,
        project = function()
          return utils.find_nearest_tsconfig()
        end,
        watch = false,
      },
      hide_progress_notifications_from_history = true,
      spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
      pretty_errors = true,
    })
  end,
}
