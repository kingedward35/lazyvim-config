return {
  "jackMort/ChatGPT.nvim",
  -- cmd = { "ChatGPT", "ChatGPTEditWithInstructions" },
  event = "VeryLazy",
  -- lazy = true,
  config = function()
    require("chatgpt").setup({
      openai_params = {
        max_tokens = 750,
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  -- commit = "d4aa4d9e31d620a0c01006e59f4449ffc7eb33ce",
}
