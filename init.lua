-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vscode and nvim only settings
if vim.g.vscode then
  -- VSCode extension

  -- map keyboard quickfix
  nnoremap("z=", "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>")
else
  -- ordinary neovim
end
