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
  -- nnoremap("z=", "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>")
  -- vim.g.mapleader = ","
  local map = function(mode, lhs, cmd)
    vim.keymap.set(mode, lhs, function()
      vim.fn.VSCodeNotify(cmd)
    end, { silent = true })
  end

  vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
  vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

  map("n", "<C-h>", "workbench.action.focusLeftGroup")
  map("n", "<C-j>", "workbench.action.focusBelowGroup")
  map("n", "<C-k>", "workbench.action.focusAboveGroup")
  map("n", "<C-l>", "workbench.action.focusRightGroup")

  -- “Leader” actions
  -- map("n", ",f", "workbench.action.quickOpen")
  -- map("n", ",m", "workbench.action.findInFiles")
  map("n", ",e", "workbench.view.explorer")
  map("n", ",t", "workbench.action.terminal.toggleTerminal")
  map("n", ",q", "workbench.action.closeActiveEditor")
  map("<D-r>", "workbench.action.reloadWindow")
  map("<leader>e", "workbench.action.toggleSidebarVisibility")
  -- ,w → save file
  map("<leader>w", "workbench.action.files.save")
  -- ,c → close editor
  map("<leader>c", "workbench.action.closeActiveEditor")
  -- ,m → quick open (file search)
  map("<leader>m", "workbench.action.quickOpen")
  -- ,st → search across project
  map("<leader>st", "workbench.action.findInFiles")
else
  -- ordinary neovim
end
