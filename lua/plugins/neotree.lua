return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    { "<leader>f", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    -- {
    --   "<leader>fe",
    --   function()
    --     require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
    --   end,
    --   desc = "Explorer NeoTree (root dir)",
    -- },
    -- {
    --   "<leader>fE",
    --   function()
    --     require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    --   end,
    --   desc = "Explorer NeoTree (cwd)",
    -- },
    -- { "<leader>f", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    -- { "<leader>F", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
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
        },
      },
    })
  end,
}
