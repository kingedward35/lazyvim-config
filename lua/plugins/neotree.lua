return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>f", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
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
        follow_current_file = true,
      },
    })
  end,
}
