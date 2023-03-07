return {
  "glepnir/lspsaga.nvim",
  branch = "main",
  -- keys = { "K", "<cmd>Lspsaga hover_doc<cr>", "Hover" },
  -- keys = { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Symbol Outline" },
  opts = {
    finder = {
      open = "o",
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = "q",
      scroll_down = "<C-f>",
      scroll_up = "<C-b>", -- quit can be a table
    },
    lightbulb = {
      enable = true,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    code_action = {
      num_shortcut = true,
      keys = {
        -- string |table type
        quit = "q",
        exec = "<CR>",
      },
    },
    rename = {
      quit = "<C-c>",
      exec = "<CR>",
      mark = "x",
      confirm = "<CR>",
      in_select = true,
      whole_project = true,
    },
    symbol_in_winbar = {
      color_mode = true,
      enable = true,
      separator = "  ",
      show_file = true,
      click_support = true,
      respect_root = false,
    },
    ui = {
      -- currently only round theme
      theme = "round",
      -- this option only work in neovim 0.9
      title = true,
      -- border type can be single,double,rounded,solid,shadow.
      border = "rounded",
      winblend = 0,
      expand = "",
      collapse = "",
      preview = " ",
      code_action = "💡",
      diagnostic = "🐞",
      incoming = " ",
      outgoing = " ",
      colors = {
        --float window normal background color
        normal_bg = "#000000",
        --title background color
        -- title_bg = "#afd700",
        red = "#e95678",
        magenta = "#b33076",
        orange = "#FF8700",
        yellow = "#f7bb3b",
        green = "#afd700",
        cyan = "#36d0e0",
        blue = "#61afef",
        purple = "#CBA6F7",
        white = "#d1d4cf",
        black = "#000000",
      },
      kind = {
        -- Folder = { "  ", bg = "#f7bb3b" },
        Folder = { "  ", "@property" },
      },
    },
  },
}
