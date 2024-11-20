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
    build = ":TSUpdate",
    event = { "LazyFile", "VeryLazy" },
    config = function()
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable_close_on_slash = false,
        },
        ensure_installed = { "vim", "lua" },
        highlight = {
          enable = true,
        },
        indent = { enable = true, disable = { "yaml", "python", "html" } },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        rainbow = {
          enable = true,
          query = "rainbow-parens",
          -- disable = { "jsx", "html" },
        },
      })

      require("template-string").setup({})
      require("ts_context_commentstring").setup({})
    end,
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
      },
      {
        "axelvc/template-string.nvim",
        lazy = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = function()
      local tsc = require("treesitter-context")

      Snacks.toggle.map("<leader>ut", {
        name = "Treesitter Context",
        get = tsc.enabled,
        set = function(state)
          if state then
            tsc.enable()
          else
            tsc.disable()
          end
        end,
      })

      return { enable = true, mode = "cursor", max_lines = 3 }
    end,
  },
}
