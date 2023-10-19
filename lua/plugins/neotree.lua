return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  -- lazy = false,
  keys = {
    -- { "<leader>f", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    -- { "<leader>F", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    { "<leader>f", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
  },
  -- keys = {
  --   { "<leader>f", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
  -- },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "right",
        width = 43,
        mappings = {
          ["C-k"] = "prev_source",
          ["C-j"] = "next_source",
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    })
  end,
}
