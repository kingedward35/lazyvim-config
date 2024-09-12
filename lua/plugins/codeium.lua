return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = false,
    -- event = "InsertEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-Enter>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-u>", function()
        return vim.fn["codeium#Chat"]()
      end, { expr = true })
    end,
  },

  -- add this to the file where you setup your other plugins:
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    enabled = true,
    -- event = "BufEnter",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<C-Enter>", neocodeium.accept)

      vim.keymap.set("i", "<C-w>", function()
        neocodeium.accept_word()
      end)
      vim.keymap.set("i", "<C-a>", function()
        neocodeium.accept_line()
      end)
      vim.keymap.set("i", "<C-;>", function()
        neocodeium.cycle_or_complete()
      end)
      vim.keymap.set("i", "<C-,>", function()
        neocodeium.cycle_or_complete(-1)
      end)
      vim.keymap.set("i", "<C-x>", function()
        neocodeium.clear()
      end)
    end,
  },
}
