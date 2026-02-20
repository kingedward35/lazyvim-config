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
    -- {
    --   "<leader>m",
    --   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    --   desc = "Buffers",
    -- },
    -- {
    --   "<leader>m",
    --   "<cmd>lua require('telescope.builtin').find_files()<cr>",
    --   -- "<cmd>Telescope find_files hidden=true<cr>",
    --   desc = "Find files",
    -- },
    { "<leader>P", "<cmd>Telescope projects<cr>", desc = "Projects" },
    { "<leader>f", "za", desc = "Fold" },
    -- { "<leader>C", group = "Codeium" },
    -- { "<leader>Ct", "<cmd>Codeium Toggle<cr>", group = "Toggle Codeium" },

    { "<leader>C", group = "NeoCodeium" },
    { "<leader>Ct", "<cmd>NeoCodeium toggle<cr>", group = "Toggle NeoCodeium" },
    -- {
    -- mode = { "n", "v" },
    -- { "<leader>k", group = "ChatGPT" },
    -- { "<leader>kc", "<cmd>ChatGPT<CR>", group = "ChatGPT" },
    -- { "<leader>ke", "<cmd>ChatGPTEditWithInstruction<CR>", group = "Edit with instruction" },
    -- { "<leader>kg", "<cmd>ChatGPTRun grammar_correction<CR>", group = "Grammar Correction" },
    -- { "<leader>kt", "<cmd>ChatGPTRun translate<CR>", group = "Translate" },
    -- { "<leader>kk", "<cmd>ChatGPTRun keywords<CR>", group = "Keywords" },
    -- { "<leader>kd", "<cmd>ChatGPTRun docstring<CR>", group = "Docstring" },
    -- { "<leader>ka", "<cmd>ChatGPTRun add_tests<CR>", group = "Add Tests" },
    -- { "<leader>ko", "<cmd>ChatGPTRun optimize_code<CR>", group = "Optimize Code" },
    -- { "<leader>ks", "<cmd>ChatGPTRun summarize<CR>", group = "Summarize" },
    -- { "<leader>kh", "<cmd>ChatGPTRun humanize<CR>", group = "Humanize" },
    -- { "<leader>kf", "<cmd>ChatGPTRun fix_bugs<CR>", group = "Fix Bugs" },
    -- { "<leader>kr", "<cmd>ChatGPTRun roxygen_edit<CR>", group = "Roxygen Edit" },
    -- { "<leader>kl", "<cmd>ChatGPTRun code_readability_analysis<CR>", group = "Code Readability Analysis" },
    -- { "<leader>kx", "<cmd>ChatGPTRun explain_code<CR>", group = "Explain Code" },
    -- },
    { "<leader>g", group = "Git" },
    { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
    -- { "<leader>gl", group = "Blame", "<cmd>lua require 'gitsigns'.blame_line()<cr>" },
    { "<leader>gl", "<cmd>lua require('gitgraph').draw({}, { all = true, max_count = 5000 })<cr>", desc = "GitGraph" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gt", "<cmd>GitBlameToggle<cr>", desc = "Toggle Blame" },
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff" },
    { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close Diff" },
    { "<leader>gdt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle Files" },
    { "<leader>gdf", "<cmd>DiffviewFocusFiles<cr>", desc = "Focus Files" },
    { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Open Diff" },
    { "<leader>gdh", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff HEAD" },
    --     w = {
    --       name = "Worktree",
    --       c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create Worktree" },
    --       s = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Switch Worktree" },
    --     },
    --     o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    --     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    --     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    { "<leader>l", group = "LSP" },
    { "<leader>lc", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
    { "<leader>ld", "<cmd>lua require('fzf-lua').diagnostics_document()<cr>", desc = "Document Diagnostics" },
    { "<leader>lw", "<cmd>lua require('fzf-lua').diagnostics_workspace()<cr>", desc = "Workspace Diagnostics" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<cr>", desc = "Format" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
    { "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
    { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>ls", "<cmd>lua require('fzf-lua').lsp_document_symbols()<cr>", desc = "Document Symbols" },
    { "<leader>lS", "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<cr>", desc = "Workspace Symbols" },
    { "<leader>s", group = "Search" },
    -- { "<leader>st", group = "Find text", "<cmd>Telescope live_grep<cr>" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sp", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Search Path" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sf", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", desc = "Search current file" },
    { "<leader>sS", "<cmd>lua require('spectre').toggle()<CR>", desc = "Search all files" },
    { "<leader>n", group = "Neotest" },
    { "<leader>nr", group = "Run file", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>" },
    { "<leader>nn", group = "Run nearest", "<cmd>lua require('neotest').run.run()<cr>" },
    { "<leader>no", group = "Open output", "<cmd>lua require('neotest').output.open({ enter = true })<cr> " },
    { "<leader>nt", group = "Toggle summary", "<cmd>lua require('neotest').summary.toggle()<cr>" },
    { "<leader>nl", group = "Run last test", "<cmd>lua require('neotest').run.run_last()<cr>" },
    { "<leader>t", group = "Terminal" },
    { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
    { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU" },
    { "<leader>tl", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Toggle lines" },
    { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
    { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
    { "<leader>j", group = "Package Json" },
    { "<leader>jt", "<cmd>lua require('package-info').toggle()<cr>", desc = "Toggle" },
    { "<leader>jd", "<cmd>lua require('package-info').delete()<cr>", desc = "Delete" },
    { "<leader>ju", "<cmd>lua require('package-info').update()<cr>", desc = "Update" },
    { "<leader>js", "<cmd>lua require('package-info').show()<cr>", desc = "Show" }},{
  }

  wk.add(mappings)
end

return M
