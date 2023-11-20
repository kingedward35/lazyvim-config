-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  guifont = "Iosevka Nerd Font:h18:b", -- the font used in graphical neovim applications
}
-- Treesitter folding
vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

if vim.fn.has("nvim-0.9.0") == 1 then
  options.splitkeep = "screen"
  options.shortmess = "filnxtToOFWIcC"
end

vim.opt.shortmess:append("c")
vim.opt.fillchars = vim.opt.fillchars + "diff:╱"
-- vim.cmd("source ~/.config/nvim/lua/extensions/neovide/init.vim")
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { only_current_line = true },
})
-- vim.g.rooter_pattern = {'.git', 'Makefile', '_darcs', '.hg', '.bzr', '.svn', 'node_modules', 'CMakeLists.txt', '.cabal', '.project'}
-- vim.g.outermost_root = true

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.skip_ts_context_commentstring_module = true

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
-- vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
