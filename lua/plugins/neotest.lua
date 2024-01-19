return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-vim-test",
    "haydenmeade/neotest-jest",
    "thenbe/neotest-playwright",
  },
  keys = {
    { "<leader>tt", false },
    { "<leader>tT", false },
    { "<leader>tr", false },
    { "<leader>ts", false },
    { "<leader>to", false },
    { "<leader>tO", false },
    { "<leader>tS", false },
  },
  config = function()
    local status_ok, neotest = pcall(require, "neotest")
    if not status_ok then
      return
    end

    local utils = require("lazyvim.util")
    local get_root = require("lazyvim.util").root.get
    require("neodev").setup({
      library = { plugins = { "neotest" }, types = true },
    })

    neotest.setup({
      adapters = {
        require("neotest-plenary"),
        require("neotest-vim-test")({
          ignore_file_types = { "python", "vim", "lua" },
        }),
        require("neotest-jest")({
          jestCommand = "npx jest",
          -- jestConfigFile = function()
          --   local file = vim.fn.expand("%:p")
          --   if string.find(file, "/packages/") then
          --     return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
          --   end
          --
          --   return vim.fn.getcwd() .. "/jest.config.js"
          -- end,
          jestConfigFile = "jest.config.js",
          -- env = { CI = true },
          -- cwd = function()
          --   local file = vim.fn.expand("%:p")
          --   if string.find(file, "/packages/") then
          --     return string.match(file, "(.-/[^/]+/)src")
          --   end
          --   return vim.fn.getcwd()
          -- end,
          cwd = function(path)
            return get_root()
            -- return vim.loop.cwd()
            -- return utils.get_root()
            -- return vim.fn.getcwd()
          end,
        }),
        require("neotest-playwright").adapter({
          options = {
            -- persist_project_selection = false,
            -- enable_dynamic_test_discovery = false,
            -- preset = "none", -- "none" | "headed" | "debug"

            -- get_playwright_binary = function()
            --   return vim.loop.cwd() + "/node_modules/.bin/playwright"
            -- end,

            -- get_playwright_config = function()
            --   return vim.loop.cwd() + "/playwright.config.ts"
            -- end,

            -- Controls the location of the spawned test process.
            -- Has no affect on neither the location of the binary nor the location of the config file.
            get_cwd = function()
              return vim.loop.cwd()
              -- return utils.get_root()
            end,

            -- env = { },

            -- Extra args to always passed to playwright. These are merged with any extra_args passed to neotest's run command.
            -- extra_args = { },

            -- Filter directories when searching for test files. Useful in large projects (see performance notes).
            -- filter_dir = function(name, rel_path, root)
            --   return name ~= "node_modules"
            -- end,
          },
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
