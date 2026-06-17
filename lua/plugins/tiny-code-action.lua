return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "folke/snacks.nvim",
      opts = {
        terminal = {},
      },
    },
  },
  event = "LspAttach",
  opts = {
    -- Use delta as the backend for diff preview
    backend = "delta",
    backend_opts = {
      delta = {
        -- Remove delta's header lines for cleaner output
        header_lines_to_remove = 4,
        args = {
          "--config",
          vim.fn.stdpath("config") .. "/delta-inline.gitconfig",
          "--line-numbers",
        },
      },
    },
    -- Use snacks as the picker
    picker = "snacks",
  },
  keys = {
    {
      "<leader>lc",
      function()
        require("tiny-code-action").code_action({
          -- Request both refactor and source code actions
          context = {
            only = { "refactor", "source" },
          },
        })
      end,
      mode = { "n", "x" },
      desc = "Code Action (Refactor + Source)",
    },
  },
}
