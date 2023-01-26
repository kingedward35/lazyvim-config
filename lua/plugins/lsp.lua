return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- disable a keymap
    keys[#keys + 1] = { "K", false }
  end,
}
