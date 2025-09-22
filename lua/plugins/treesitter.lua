return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
    config = function()
      -- require("rainbow-delimiters.setup").setup({
      --   strategy = {
      --     [""] = rainbow_delimiters.strategy["global"],
      --     vim = rainbow_delimiters.strategy["local"],
      --   },
      --   query = {
      --     [""] = "rainbow-delimiters",
      --     lua = "rainbow-blocks",
      --   },
      --   highlight = {
      --     "RainbowDelimiterRed",
      --     "RainbowDelimiterYellow",
      --     "RainbowDelimiterBlue",
      --     "RainbowDelimiterOrange",
      --     "RainbowDelimiterGreen",
      --     "RainbowDelimiterViolet",
      --     "RainbowDelimiterCyan",
      --   },
      -- })
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
          tsx = "rainbow-parens",
          javascript = "rainbow-delimiters-react",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    dependencies = {
      {
        "axelvc/template-string.nvim",
        config = function()
          require("template-string").setup({})
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = function()
      local tsc = require("treesitter-context")
      Snacks.toggle({
        name = "Treesitter Context",
        get = tsc.enabled,
        set = function(state)
          if state then
            tsc.enable()
          else
            tsc.disable()
          end
        end,
      }):map("<leader>ut")
      return { mode = "cursor", max_lines = 3 }
    end,
  },
}
