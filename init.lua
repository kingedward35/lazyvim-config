-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.g.neovide_fullscreen = true
-- vim.g.lazygit_config = false

-- vscode and nvim only settings
-- vim.cmd('autocmd VimEnter * lua vim.fn.execute("lcd " .. vim.fn.expand("%:p:h"))')
-- vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#9DA9A0" })

-- Define a custom command named MyCustomCommand
if vim.g.vscode then
  -- VSCode extension

  -- map keyboard quickfix
  nnoremap("z=", "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>")
else
  -- ordinary neovim
end
