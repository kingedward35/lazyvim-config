return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "zephyr",
      -- colorscheme = "tokyonight",
      colorscheme = "tokyodark",
      -- colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          colors.bg_dark = "#000000"
          colors.bg = "#000000"
        end,
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = true,
    opts = {
      custom_palette = {
        black = "#000000",
        bg0 = "#000000",
      },
      styles = {
        comments = { italic = true }, -- style for comments
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
      },
    },
  },
  {
    "kingedward35/zephyr-nvim",
    lazy = true,
  },
  --  config = function()
  --    -- vim.g.everforest_background = "hard"
  --    vim.cmd.colorscheme("zephyr")
  --    vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#fff000" })
  --  end,
}
