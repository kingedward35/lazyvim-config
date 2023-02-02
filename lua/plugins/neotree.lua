return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<leader>f",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
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
