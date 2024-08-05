-- return {
--   "folke/which-key.nvim",
--   lazy = true,
--   config = function()
--     local which_key = require("which-key")
--     which_key.setup({
--       plugins = {
--         marks = true, -- shows a list of your marks on ' and `
--         registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--         spelling = {
--           enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--           suggestions = 20, -- how many suggestions should be shown in the list?
--         },
--         -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--         -- No actual key bindings are created
--         presets = {
--           operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
--           motions = false, -- adds help for motions
--           text_objects = false, -- help for text objects triggered after entering an operator
--           windows = true, -- default bindings on <c-w>
--           nav = true, -- misc bindings to work with windows
--           z = true, -- bindings for folds, spelling and others prefixed with z
--           g = true, -- bindings for prefixed with g
--         },
--       },
--       icons = {
--         breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--         separator = "➜", -- symbol used between a key and it's label
--         group = "+", -- symbol prepended to a group
--       },
--       keys = {
--         scroll_down = "<c-d>", -- binding to scroll down inside the popup
--         scroll_up = "<c-u>", -- binding to scroll up inside the popup
--       },
--       win = {
--         border = "rounded", -- none, single, double, shadow
--         position = "bottom", -- bottom, top
--         margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
--         padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--         winblend = 0,
--       },
--       layout = {
--         height = { min = 4, max = 25 }, -- min and max height of the columns
--         width = { min = 20, max = 50 }, -- min and max width of the columns
--         spacing = 3, -- spacing between columns
--         align = "left", -- align columns left, center or right
--       },
--       show_help = true, -- show help message on the command line when the popup is visible
--       -- triggers = { { "auto" } }, -- automatically setup triggers
--       -- triggers = { { "<leader>" } }, -- or specify a list manually
--       -- triggers_blacklist = {
--       -- list of mode / prefixes that should never be hooked by WhichKey
--       -- this is mostly relevant for key maps that start with a native binding
--       -- most people should not need to change this
--       -- i = { "j", "k" },
--       -- v = { "j", "k" },
--       -- },
--     })
--
--     which_key.add({
--       { "<leader>;", "<cmd>Dashboard<cr>", desc = "Dashboard" },
--       -- ["fb"] = { "<cmd>Telescope file_browser<cr>", "File Browser" },
--       { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
--       { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
--       { "<leader>c", "<cmd>bdelete!<CR>", desc = "Close Buffer" },
--       { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
--       { "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Comment" },
--       { "<leader>r", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
--       {
--         "<leader>m",
--         "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--         desc = "Buffers",
--       },
--       {
--         "<leader>m",
--         "<cmd>lua require('telescope.builtin').find_files()<cr>",
--         -- "<cmd>Telescope find_files hidden=true<cr>",
--         desc = "Find files",
--       },
--       -- ["st"] = { "<cmd>Telescope live_grep <cr>", "Find Text" },
--       { "<leader>P", "<cmd>Telescope projects<cr>", desc = "Projects" },
--       { "<leader>f", "za", desc = "Fold" },
--     })
--     --     name = "Codeium",
--     --     t = { "<cmd>Codeium Toggle<cr>", "Toggle Codeium" },
--     --   },
--     --   k = {
--     --     name = "ChatGPT",
--     --     mode = { "n", "v" },
--     --     c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
--     --     e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
--     --     g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
--     --     t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
--     --     k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
--     --     d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
--     --     a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
--     --     o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
--     --     s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
--     --     f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
--     --     x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
--     --     r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
--     --     l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
--     --   },
--     --
--     --   g = {
--     --     name = "Git",
--     --     g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
--     --     j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
--     --     k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
--     --     l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--     --     p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--     --     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--     --     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--     --     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--     --     u = {
--     --       "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--     --       "Undo Stage Hunk",
--     --     },
--     --     w = {
--     --       name = "Worktree",
--     --       c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create Worktree" },
--     --       s = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Switch Worktree" },
--     --     },
--     --     o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--     --     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--     --     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--     --     d = {
--     --       name = "Diff",
--     --       c = { "<cmd>DiffviewClose<cr>", "Close Diff" },
--     --       h = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff HEAD" },
--     --       o = { "<cmd>DiffviewOpen<cr>", "Open Diff" },
--     --       t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files" },
--     --       f = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files" },
--     --     },
--     --     t = { "<cmd>GitBlameToggle<cr>", "Toggle Blame" },
--     --   },
--     --
--     --   l = {
--     --     name = "LSP",
--     --     -- c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
--     --     c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     --     d = {
--     --       "<cmd>Telescope lsp_document_diagnostics<cr>",
--     --       "Document Diagnostics",
--     --     },
--     --     w = {
--     --       "<cmd>Telescope lsp_workspace_diagnostics<cr>",
--     --       "Workspace Diagnostics",
--     --     },
--     --     f = { "<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<cr>", "Format" },
--     --     i = { "<cmd>LspInfo<cr>", "Info" },
--     --     I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
--     --     j = {
--     --       "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
--     --       "Next Diagnostic",
--     --     },
--     --     k = {
--     --       "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
--     --       "Prev Diagnostic",
--     --     },
--     --     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--     --     o = { "<cmd>Lspsaga outline<cr>", "Symbol Outline" },
--     --     q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--     --     r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--     --     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--     --     S = {
--     --       "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--     --       "Workspace Symbols",
--     --     },
--     --   },
--     --   -- vim.keymap.set(
--     --   --   "n",
--     --   --   "<leader>sp",
--     --   --   require("telescope").extensions.live_grep_args.live_grep_args,
--     --   --   { noremap = true }
--     --   -- )
--     --   s = {
--     --     name = "Search",
--     --     t = { "<cmd>Telescope live_grep<cr>", "Find text" },
--     --     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--     --     c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--     --     h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--     --     M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--     --     R = { "<cmd>Telescope registers<cr>", "Registers" },
--     --     p = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Search Path" },
--     --     k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--     --     C = { "<cmd>Telescope commands<cr>", "Commands" },
--     --     f = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search current file" },
--     --     S = { '<cmd>lua require("spectre").toggle()<CR>', "Search all files" },
--     --   },
--     --   n = {
--     --     name = "Neotest",
--     --     r = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run file" },
--     --     n = { "<cmd>lua require('neotest').run.run()<cr>", "Run nearest" },
--     --     o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr> ", "Open output" },
--     --     t = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle summary" },
--     --     l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run last test" },
--     --   },
--     --   t = {
--     --     name = "Terminal",
--     --     n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
--     --     u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
--     --     l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle lines" },
--     --     p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
--     --     t = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
--     --     h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
--     --     v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
--     --   },
--     --   j = {
--     --     name = "Package Json",
--     --     t = { "<cmd>lua require('package-info').toggle()<cr>", "Toggle" },
--     --     d = { "<cmd>lua require('package-info').delete()<cr>", "Delete" },
--     --     u = { "<cmd>lua require('package-info').update()<cr>", "Update" },
--     --   },
--     -- }
--     --
--
--     -- which_key.register(mappings, opts)
--   end,
-- }
local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local which_key = require("which-key")
  which_key.setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      border = "rounded",
      no_overlap = false,
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = false,
      title_pos = "center",
      zindex = 1000,
    },
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  })

  local wk = require("which-key")

  local mappings = {
    { "<leader>;", "<cmd>Dashboard<cr>", desc = "Dashboard" },
    -- ["fb"] = { "<cmd>Telescope file_browser<cr>", "File Browser" },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
    { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
    { "<leader>c", "<cmd>bdelete!<CR>", desc = "Close Buffer" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
    { "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Comment" },
    { "<leader>r", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
    {
      "<leader>m",
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      desc = "Buffers",
    },
    {
      "<leader>m",
      "<cmd>lua require('telescope.builtin').find_files()<cr>",
      -- "<cmd>Telescope find_files hidden=true<cr>",
      desc = "Find files",
    },
    { "<leader>P", "<cmd>Telescope projects<cr>", desc = "Projects" },
    { "<leader>f", "za", desc = "Fold" },
    { "<leader>C", group = "Codeium" },
    { "<leader>Ct", "<cmd>Codeium Toggle<cr>", group = "Toggle Codeium" },
    {
      mode = { "n", "v" },
      { "<leader>k", group = "ChatGPT" },
      { "<leader>kc", "<cmd>ChatGPT<CR>", group = "ChatGPT" },
      { "<leader>ke", "<cmd>ChatGPTEditWithInstruction<CR>", group = "Edit with instruction" },
      { "<leader>kg", "<cmd>ChatGPTRun grammar_correction<CR>", group = "Grammar Correction" },
      { "<leader>kt", "<cmd>ChatGPTRun translate<CR>", group = "Translate" },
      { "<leader>kk", "<cmd>ChatGPTRun keywords<CR>", group = "Keywords" },
      { "<leader>kd", "<cmd>ChatGPTRun docstring<CR>", group = "Docstring" },
      { "<leader>ka", "<cmd>ChatGPTRun add_tests<CR>", group = "Add Tests" },
      { "<leader>ko", "<cmd>ChatGPTRun optimize_code<CR>", group = "Optimize Code" },
      { "<leader>ks", "<cmd>ChatGPTRun summarize<CR>", group = "Summarize" },
      { "<leader>kh", "<cmd>ChatGPTRun humanize<CR>", group = "Humanize" },
      { "<leader>kf", "<cmd>ChatGPTRun fix_bugs<CR>", group = "Fix Bugs" },
      { "<leader>kr", "<cmd>ChatGPTRun roxygen_edit<CR>", group = "Roxygen Edit" },
      { "<leader>kl", "<cmd>ChatGPTRun code_readability_analysis<CR>", group = "Code Readability Analysis" },
      { "<leader>kx", "<cmd>ChatGPTRun explain_code<CR>", group = "Explain Code" },
    },
    { "<leader>g", group = "Git" },
    { "<leader>gg", group = "Lazygit", "<cmd>lua _LAZYGIT_TOGGLE()<CR>" },
    { "<leader>gj", group = "Next Hunk", "<cmd>lua require 'gitsigns'.next_hunk()<cr>" },
    { "<leader>gk", group = "Prev Hunk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>" },
    -- { "<leader>gl", group = "Blame", "<cmd>lua require 'gitsigns'.blame_line()<cr>" },
    {
      "<leader>gl",
      group = "New GitGraph",
      "<cmd>lua require('gitgraph').draw({}, { all = true, max_count = 5000 })<cr>",
    },
    { "<leader>gp", group = "Preview Hunk", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>" },
    { "<leader>gr", group = "Reset Hunk", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>" },
    { "<leader>gs", group = "Stage Hunk", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>" },
    { "<leader>gu", group = "Undo Stage Hunk", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>" },
    { "<leader>gR", group = "Reset Buffer", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>" },
    { "<leader>gt", group = "Toggle Blame", "<cmd>GitBlameToggle<cr>" },
    { "<leader>gd", group = "Diff", "<cmd>DiffviewOpen<cr>" },
    { "<leader>gdc", group = "Close Diff", "<cmd>DiffviewClose<cr>" },
    { "<leader>gdt", group = "Toggle Files", "<cmd>DiffviewToggleFiles<cr>" },
    { "<leader>gdf", group = "Focus Files", "<cmd>DiffviewFocusFiles<cr>" },
    { "<leader>gdo", group = "Open Diff", "<cmd>DiffviewOpen<cr>" },
    { "<leader>gdh", group = "Diff HEAD", "<cmd>Gitsigns diffthis HEAD<cr>" },
    --     w = {
    --       name = "Worktree",
    --       c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create Worktree" },
    --       s = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Switch Worktree" },
    --     },
    --     o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    --     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    --     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    { "<leader>l", group = "LSP" },
    { "<leader>lc", group = "Code Action", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
    { "<leader>ld", group = "Document Diagnostics", "<cmd>Telescope lsp_document_diagnostics<cr>" },
    { "<leader>lw", group = "Workspace Diagnostics", "<cmd>Telescope lsp_workspace_diagnostics<cr>" },
    { "<leader>lf", group = "Format", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<cr>" },
    { "<leader>li", group = "Info", "<cmd>LspInfo<cr>" },
    { "<leader>lI", group = "Installer Info", "<cmd>LspInstallInfo<cr>" },
    { "<leader>lj", group = "Next Diagnostic", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" },
    { "<leader>lk", group = "Prev Diagnostic", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>" },
    { "<leader>ll", group = "CodeLens Action", "<cmd>lua vim.lsp.codelens.run()<cr>" },
    { "<leader>lo", group = "Outline", "<cmd>Lspsaga outline<cr>" },
    { "<leader>lq", group = "Quickfix", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>" },
    { "<leader>lr", group = "Rename", "<cmd>lua vim.lsp.buf.rename()<cr>" },
    { "<leader>ls", group = "Document Symbols", "<cmd>Telescope lsp_document_symbols<cr>" },
    { "<leader>lS", group = "Workspace Symbols", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>" },
    { "<leader>s", group = "Search" },
    { "<leader>st", group = "Find text", "<cmd>Telescope live_grep<cr>" },
    { "<leader>sb", group = "Checkout branch", "<cmd>Telescope git_branches<cr>" },
    { "<leader>sc", group = "Colorscheme", "<cmd>Telescope colorscheme<cr>" },
    { "<leader>sh", group = "Find Help", "<cmd>Telescope help_tags<cr>" },
    { "<leader>sM", group = "Man Pages", "<cmd>Telescope man_pages<cr>" },
    { "<leader>sR", group = "Registers", "<cmd>Telescope registers<cr>" },
    {
      "<leader>sp",
      group = "Search Path",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
    },
    { "<leader>sk", group = "Keymaps", "<cmd>Telescope keymaps<cr>" },
    { "<leader>sC", group = "Commands", "<cmd>Telescope commands<cr>" },
    {
      "<leader>sf",
      group = "Search current file",
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
    },
    { "<leader>sS", group = "Search all files", "<cmd>lua require('spectre').toggle()<CR>" },
    { "<leader>n", group = "Neotest" },
    { "<leader>nr", group = "Run file", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>" },
    { "<leader>nn", group = "Run nearest", "<cmd>lua require('neotest').run.run()<cr>" },
    { "<leader>no", group = "Open output", "<cmd>lua require('neotest').output.open({ enter = true })<cr> " },
    { "<leader>nt", group = "Toggle summary", "<cmd>lua require('neotest').summary.toggle()<cr>" },
    { "<leader>nl", group = "Run last test", "<cmd>lua require('neotest').run.run_last()<cr>" },
    { "<leader>t", group = "Terminal" },
    { "<leader>tn", group = "Node", "<cmd>lua _NODE_TOGGLE()<cr>" },
    { "<leader>tu", group = "NCDU", "<cmd>lua _NCDU_TOGGLE()<cr>" },
    { "<leader>tl", group = "Toggle lines", "<cmd>lua require('lsp_lines').toggle()<cr>" },
    { "<leader>tp", group = "Python", "<cmd>lua _PYTHON_TOGGLE()<cr>" },
    { "<leader>th", group = "Horizontal", "<cmd>ToggleTerm size=10 direction=horizontal<cr>" },
    { "<leader>tv", group = "Vertical", "<cmd>ToggleTerm size=80 direction=vertical<cr>" },
    { "<leader>tt", group = "Float", "<cmd>ToggleTerm direction=float<cr>" },
    { "<leader>j", group = "Package Json" },
    { "<leader>jt", group = "Toggle", "<cmd>lua require('package-info').toggle()<cr>" },
    { "<leader>jd", group = "Delete", "<cmd>lua require('package-info').delete()<cr>" },
    { "<leader>ju", group = "Update", "<cmd>lua require('package-info').update()<cr>" },
  }

  wk.add(mappings)
end

return M
