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
      },
    })
  end,
}
