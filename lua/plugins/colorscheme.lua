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
    priority = 1000,
    opts = {
      custom_palette = {
        black = "#000000",
        bg0 = "#000000",
      },
      custom_highlights = {
        -- FloatBorder = { fg = "#fff000" },
        -- FloatTitle = { fg = "#fff000" },
        -- #d39f2b
        -- #8c00bf
        FloatTitle = { fg = "#8c00bf" },
        FloatBorder = { fg = "#8c00bf" },
        LspInfoBorder = { fg = "#8c00bf" },
        CmpDocumentationBorder = { fg = "#8c00bf" },
        TelescopeBorder = { fg = "#8c00bf" },
        TelescopePromptTitle = { fg = "#d39f2b" },
        TelescopeResultsComment = { fg = "#d39f2b" },
        NeoTreeDirectoryIcon = { fg = "#d39f2b" },
        NeoTreeDirectoryName = { fg = "#d39f2b" },
        ["@variable"] = { fg = "#d39f2b" },
        -- FloatBorder = { fg = c.border_highlight, bg = c.bg_float },
        -- FloatTitle = { fg = c.border_highlight, bg = c.bg_float },
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
