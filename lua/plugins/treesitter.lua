return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
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

  -- "HiPhish/nvim-ts-rainbow2",
  -- config = function()
  --   require("nvim-treesitter.configs").setup({
  --     rainbow = {
  --       enable = true,
  --       -- list of languages you want to disable the plugin for
  --       disable = { "jsx", "cpp" },
  --       -- Which query to use for finding delimiters
  --       query = "rainbow-parens",
  --       -- Highlight the entire buffer all at once
  --       strategy = require("ts-rainbow.strategy.global"),
  --       -- Do not enable for files with more than n lines
  --       max_file_lines = 3000,
  --       extended_mode = true,
  --     },
  --     sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  --     ignore_install = { "" }, -- List of parsers to ignore installing
  --     autotag = {
  --       enable = true,
  --     },
  --     ensure_installed = { "c", "lua", "rust" },
  --     matchup = { enable = true },
  --     autopairs = {
  --       enable = true,
  --     },
  --     highlight = {
  --       enable = true, -- false will disable the whole extension
  --       disable = { "" }, -- list of language that will be disabled
  --       additional_vim_regex_highlighting = true,
  --     },
  --     indent = { enable = true, disable = { "yaml" } },
  --     context_commentstring = {
  --       enable = true,
  --       enable_autocmd = false,
  --     },
  --   })
  -- end,
}
