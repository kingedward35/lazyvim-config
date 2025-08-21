return {
  "mfussenegger/nvim-lint",
  enabled = true,
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- require("mason-tool-installer").setup({
    --
    --   -- a list of all tools you want to ensure are installed upon
    --   -- start
    --   ensure_installed = {
    --
    --     -- you can pin a tool to a particular version
    --     { "eslint_d", version = "13.1.2" },
    --
    --     -- you can turn off/on auto_update per tool
    --     -- { "bash-language-server", auto_update = true },
    --
    --     -- you can do conditional installing
    --     -- {
    --     --   "gopls",
    --     --   condition = function()
    --     --     return not os.execute("go version")
    --     --   end,
    --     -- },
    --     "lua-language-server",
    --     "vim-language-server",
    --     "stylua",
    --     "shellcheck",
    --     "editorconfig-checker",
    --     "luacheck",
    --     "misspell",
    --     "shellcheck",
    --     "staticcheck",
    --     "vint",
    --   },
    --
    --   -- if set to true this will check each tool for updates. If updates
    --   -- are available the tool will be updated. This setting does not
    --   -- affect :MasonToolsUpdate or :MasonToolsInstall.
    --   -- Default: false
    --   auto_update = false,
    --
    --   -- automatically install / update on startup. If set to false nothing
    --   -- will happen on startup. You can use :MasonToolsInstall or
    --   -- :MasonToolsUpdate to install tools and check for updates.
    --   -- Default: true
    --   run_on_start = true,
    --
    --   -- set a delay (in ms) before the installation starts. This is only
    --   -- effective if run_on_start is set to true.
    --   -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
    --   -- Default: 0
    --   start_delay = 3000, -- 3 second delay
    --
    --   -- Only attempt to install if 'debounce_hours' number of hours has
    --   -- elapsed since the last time Neovim was started. This stores a
    --   -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
    --   -- This is only relevant when you are using 'run_on_start'. It has no
    --   -- effect when running manually via ':MasonToolsInstall' etc....
    --   -- Default: nil
    --   debounce_hours = 5, -- at least 5 hours between attempts to install/update
    --
    --   -- By default all integrations are enabled. If you turn on an integration
    --   -- and you have the required module(s) installed this means you can use
    --   -- alternative names, supplied by the modules, for the thing that you want
    --   -- to install. If you turn off the integration (by setting it to false) you
    --   -- cannot use these alternative names. It also suppresses loading of those
    --   -- module(s) (assuming any are installed) which is sometimes wanted when
    --   -- doing lazy loading.
    --   integrations = {
    --     ["mason-lspconfig"] = true,
    --     ["mason-null-ls"] = true,
    --     ["mason-nvim-dap"] = true,
    --   },
    -- })
    local lint = require("lint")
    -- local eslint = lint.linters.eslint
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- eslint.args = {
    --   "--no-warn-ignored", -- <-- this is the key argument
    --   "--format",
    --   "json",
    --   "--stdin",
    --   "--stdin-filename",
    --   function()
    --     return vim.api.nvim_buf_get_name(0)
    --   end,
    -- }

    lint.linters_by_ft = {
      -- javascript = { "eslint" },
      -- typescript = { "eslint" },
      -- javascriptreact = { "eslint" },
      -- typescriptreact = { "eslint" },
      -- svelte = { "eslint" },
      -- python = { "pylint" },
      markdown = { "markdownlint" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
