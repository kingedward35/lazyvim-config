return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-vim-test",
    "haydenmeade/neotest-jest",
  },
  config = function()
    local status_ok, neotest = pcall(require, "neotest")
    if not status_ok then
      return
    end
    local utils = require("lazyvim.util")

    neotest.setup({
      adapters = {
        require("neotest-plenary"),
        require("neotest-vim-test")({
          ignore_file_types = { "python", "vim", "lua" },
        }),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            -- return vim.loop.cwd()
            return utils.get_root()
            -- return vim.fn.getcwd()
          end,
        }),
      },
      icons = {
        passed = "",
        running = "",
        failed = "",
        -- expanded = "",
        -- child_prefix = "",
        -- child_indent = "",
        -- final_child_prefix = "",
        -- non_collapsible = "",
        -- collapsed = "",
        -- unknown = "",
        -- skipped = "",
      },
      floating = {
        border = "single",
        max_height = 0.8,
        max_width = 0.9,
      },
      summary = {
        mappings = {
          attach = "a",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          jumpto = "i",
          output = "o",
          run = "r",
          short = "O",
          stop = "u",
        },
      },
    })

    local group = vim.api.nvim_create_augroup("NeotestConfig", {})
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neotest-output",
      group = group,
      callback = function(opts)
        vim.keymap.set("n", "q", function()
          pcall(vim.api.nvim_win_close, 0, true)
        end, {
          buffer = opts.buf,
        })
      end,
    })
  end,
}
