-- return {
--   {
--     "neovim/nvim-lspconfig",
--     lazy = true,
--     -- event = { "BufReadPre", "BufNewFile" },
--     init = function()
--       local borders = {
--         top = "▔",
--         bottom = "▁",
--         right = "▕",
--         left = "▏",
--         top_right = "🭾",
--         top_left = "🭽",
--         bottom_right = "🭿",
--         bottom_left = "🭼",
--       }
--
--       vim.g.defaults = {
--         colors = { -- {{{
--           GitAdd = { fg = "#80e080", bg = "#1B492B" },
--           GitChange = { fg = "#c0b05f", bg = "#4E460C" },
--           GitDelete = { fg = "#ff9095", bg = "#65161B" },
--           Critical = { fg = "#ff0000" },
--         }, --}}}
--         signs = { --{{{
--           add = "+",
--           change = "~",
--           delete = "x",
--           error = "x",
--           warn = "!",
--           info = "?",
--           hint = "*",
--         }, --}}}
--         border = { --{{{
--           named = borders,
--           floating = {
--             borders.top_left,
--             borders.top,
--             borders.top_right,
--             borders.right,
--             borders.bottom_right,
--             borders.bottom,
--             borders.bottom_left,
--             borders.left,
--           },
--           normal = {
--             borders.top_left,
--             borders.top,
--             borders.top_right,
--             borders.right,
--             borders.bottom_right,
--             borders.bottom,
--             borders.bottom_left,
--             borders.left,
--           },
--           telescope = {
--             ivy = {
--               borders.top,
--               borders.right,
--               borders.bottom,
--               borders.left,
--               borders.top_left,
--               borders.top_right,
--               borders.bottom_right,
--               borders.bottom_left,
--             },
--           },
--         }, --}}}
--         ignored_fts = { -- {{{
--           ui = {
--             "MiniStarter",
--             "NvimTree",
--             "esqueleto.ivy.selection",
--             "help",
--             "loclist",
--             "orgagenda",
--             "packer",
--             "qf",
--             "quickfix",
--             "starter",
--             "terminal",
--           },
--         }, -- }}}
--       }
--       require("lspconfig.ui.windows").default_options.border = "rounded"
--       local ok, wf = pcall(require, "vim.lsp._watchfiles")
--       local keys = require("lazyvim.plugins.lsp.keymaps").get()
--       -- change a keymap
--       -- disable a keymap
--       keys[#keys + 1] = { "K", false }
--       if ok then
--         wf._watchfunc = function()
--           return function() end
--         end
--       end
--     end,
--     opts = {
--       format = { timeout_ms = 5000 },
--       inlay_hints = { enabled = true },
--       ---@type lspconfig.options
--       servers = {
--         eslint = {
--           settings = {
--             -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
--             workingDirectories = { mode = "auto" },
--           },
--         },
--         ansiblels = {},
--         bashls = {},
--         clangd = {},
--         -- denols = {},
--         cssls = {},
--         dockerls = {},
--         ruff_lsp = {},
--         tailwindcss = {
--           root_dir = function(...)
--             return require("lspconfig.util").root_pattern(".git")(...)
--           end,
--         },
--         -- tsserver = {
--         --   root_dir = function(...)
--         --     return require("lspconfig.util").root_pattern(".git")(...)
--         --   end,
--         --   single_file_support = false,
--         --   settings = {
--         --     typescript = {
--         --       inlayHints = {
--         --         includeInlayParameterNameHints = "literal",
--         --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         --         includeInlayFunctionParameterTypeHints = true,
--         --         includeInlayVariableTypeHints = false,
--         --         includeInlayPropertyDeclarationTypeHints = true,
--         --         includeInlayFunctionLikeReturnTypeHints = true,
--         --         includeInlayEnumMemberValueHints = true,
--         --       },
--         --     },
--         --     javascript = {
--         --       inlayHints = {
--         --         includeInlayParameterNameHints = "all",
--         --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         --         includeInlayFunctionParameterTypeHints = true,
--         --         includeInlayVariableTypeHints = true,
--         --         includeInlayPropertyDeclarationTypeHints = true,
--         --         includeInlayFunctionLikeReturnTypeHints = true,
--         --         includeInlayEnumMemberValueHints = true,
--         --       },
--         --     },
--         --   },
--         -- },
--         html = {},
--         marksman = {},
--         pyright = {
--           enabled = false,
--         },
--         rust_analyzer = {
--           -- settings = {
--           --   ["rust-analyzer"] = {
--           --     procMacro = { enable = true },
--           --     cargo = { allFeatures = true },
--           --     checkOnSave = {
--           --       command = "clippy",
--           --       extraArgs = { "--no-deps" },
--           --     },
--           --   },
--           -- },
--         },
--         yamlls = {
--           settings = {
--             yaml = {
--               keyOrdering = false,
--             },
--           },
--         },
--         lua_ls = {
--           -- enabled = false,
--           -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
--           single_file_support = true,
--           settings = {
--             Lua = {
--               workspace = {
--                 checkThirdParty = false,
--               },
--               completion = {
--                 workspaceWord = true,
--                 callSnippet = "Both",
--               },
--               misc = {
--                 parameters = {
--                   -- "--log-level=trace",
--                 },
--               },
--               hint = {
--                 enable = true,
--                 setType = false,
--                 paramType = true,
--                 paramName = "Disable",
--                 semicolon = "Disable",
--                 arrayIndex = "Disable",
--               },
--               doc = {
--                 privateName = { "^_" },
--               },
--               type = {
--                 castNumberToInteger = true,
--               },
--               diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {
--                   "vim",
--                   "require",
--                 },
--                 disable = { "incomplete-signature-doc", "trailing-space" },
--                 -- enable = false,
--                 groupSeverity = {
--                   strong = "Warning",
--                   strict = "Warning",
--                 },
--                 groupFileStatus = {
--                   ["ambiguity"] = "Opened",
--                   ["await"] = "Opened",
--                   ["codestyle"] = "None",
--                   ["duplicate"] = "Opened",
--                   ["global"] = "Opened",
--                   ["luadoc"] = "Opened",
--                   ["redefined"] = "Opened",
--                   ["strict"] = "Opened",
--                   ["strong"] = "Opened",
--                   ["type-check"] = "Opened",
--                   ["unbalanced"] = "Opened",
--                   ["unused"] = "Opened",
--                 },
--                 unusedLocalExclude = { "_*" },
--               },
--               format = {
--                 enable = true,
--                 defaultConfig = {
--                   indent_style = "space",
--                   indent_size = "2",
--                   continuation_indent_size = "2",
--                 },
--               },
--             },
--           },
--         },
--         vimls = {},
--       },
--     --   setup = {
--     --     eslint = function()
--     --       local function get_client(buf)
--     --         return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
--     --       end
--     --
--     --       local formatter = LazyVim.lsp.formatter({
--     --         name = "eslint: lsp",
--     --         primary = false,
--     --         priority = 200,
--     --         filter = "eslint",
--     --       })
--     --
--     --       -- Use EslintFixAll on Neovim < 0.10.0
--     --       if not pcall(require, "vim.lsp._dynamic") then
--     --         formatter.name = "eslint: EslintFixAll"
--     --         formatter.sources = function(buf)
--     --           local client = get_client(buf)
--     --           return client and { "eslint" } or {}
--     --         end
--     --         formatter.format = function(buf)
--     --           local client = get_client(buf)
--     --           if client then
--     --             local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
--     --             if #diag > 0 then
--     --               vim.cmd("EslintFixAll")
--     --             end
--     --           end
--     --         end
--     --       end
--     --
--     --       -- register the formatter with LazyVim
--     --       LazyVim.format.register(formatter)
--     --     end,
--     --   },
--     -- },
--     -- init = function()
--     --   local keys = require("lazyvim.plugins.lsp.keymaps").get()
--     --   -- change a keymap
--     --   -- disable a keymap
--     --   keys[#keys + 1] = { "K", false }
--     -- end,
--   },
--   -- {
--   --   "neovim/nvim-lspconfig",
--   --   event = "LazyFile",
--   --   opts = {
--   --     -- diagnostics = {
--   --     --   float = {
--   --     --     source = false,
--   --     --     border = "rounded",
--   --     --     -- header = false,
--   --     --     format = function(diagnostic)
--   --     --       return string.format("%s: %s ", diagnostic.source or "", diagnostic.message)
--   --     --     end,
--   --     --   },
--   --     -- },
--   --     -- setup = {
--   --     --   eslint = function()
--   --     --     require("lazyvim.util").lsp.on_attach(function(client)
--   --     --       if client.name == "eslint" then
--   --     --         client.server_capabilities.documentFormattingProvider = true
--   --     --       elseif client.name == "tsserver" then
--   --     --         client.server_capabilities.documentFormattingProvider = false
--   --     --       end
--   --     --     end)
--   --     --   end,
--   --     -- },
--   --     servers = {
--   --       eslint = {
--   --         settings = {
--   --           -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
--   --           workingDirectories = { mode = "auto" },
--   --         },
--   --       },
--   --     },
--   --     setup = {
--   --       eslint = function()
--   --         local function get_client(buf)
--   --           return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
--   --         end
--   --
--   --         local formatter = require("lazyvim.util").lsp.formatter({
--   --           name = "eslint: lsp",
--   --           primary = false,
--   --           priority = 200,
--   --           filter = "eslint",
--   --         })
--   --
--   --         -- Use EslintFixAll on Neovim < 0.10.0
--   --         if not pcall(require, "vim.lsp._dynamic") then
--   --           formatter.name = "eslint: EslintFixAll"
--   --           formatter.sources = function(buf)
--   --             local client = get_client(buf)
--   --             return client and { "eslint" } or {}
--   --           end
--   --           formatter.format = function(buf)
--   --             local client = get_client(buf)
--   --             if client then
--   --               local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
--   --               if #diag > 0 then
--   --                 vim.cmd("EslintFixAll")
--   --               end
--   --             end
--   --           end
--   --         end
--   --
--   --         -- register the formatter with LazyVim
--   --         require("lazyvim.util").format.register(formatter)
--   --       end,
--   --     },
--   --   },
--   --   -- opts = {
--   --   --   ---@type lspconfig.options
--   --   --   servers = {
--   --   --     -- tsserver will be automatically installed with mason and loaded with lspconfig
--   --   --     tsserver = {},
--   --   --   },
--   --   --   -- you can do any additional lsp server setup here
--   --   --   -- return true if you don't want this server to be setup with lspconfig
--   --   --   ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
--   --   --   setup = {
--   --   --     -- example to setup with typescript.nvim
--   --   --     tsserver = function(_, opts)
--   --   --       require("typescript").setup({ server = opts })
--   --   --       return true
--   --   --     end,
--   --   --     -- Specify * to use this function as a fallback for any server
--   --   --     -- ["*"] = function(server, opts) end,
--   --   --   },
--   --   -- },
--   -- },
--   -- { import = "plugins.extras.lang.rust" },
--   { import = "plugins.extras.lang.js-ts" },
--   {
--     "atusy/tsnode-marker.nvim",
--     lazy = true,
--     init = function()
--       vim.api.nvim_create_autocmd("FileType", {
--         group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
--         pattern = "markdown",
--         callback = function(ctx)
--           require("tsnode-marker").set_automark(ctx.buf, {
--             target = { "code_fence_content" }, -- list of target node types
--             hl_group = "CursorLine", -- highlight group
--           })
--         end,
--       })
--     end,
--   },
-- -- }
return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    -- event = { "BufReadPre", "BufNewFile" },
    init = function()
      -- require("lspconfig.ui.windows").default_options = {
      --   border = "single",
      -- }
      -- disable lsp watcher. Too slow on linux
      -- vim.lsp.handlers["textDocument/publishDiagnostics"] = function()
      --   local border = {
      --     { "🭽", "FloatBorder" },
      --     { "▔", "FloatBorder" },
      --     { "🭾", "FloatBorder" },
      --     { "▕", "FloatBorder" },
      --     { "🭿", "FloatBorder" },
      --     { "▁", "FloatBorder" },
      --     { "🭼", "FloatBorder" },
      --     { "▏", "FloatBorder" },
      --   }
      --   return { border = border }
      -- end
      local borders = {
        top = "▔",
        bottom = "▁",
        right = "▕",
        left = "▏",
        top_right = "🭾",
        top_left = "🭽",
        bottom_right = "🭿",
        bottom_left = "🭼",
      }

      vim.g.defaults = {
        colors = { -- {{{
          GitAdd = { fg = "#80e080", bg = "#1B492B" },
          GitChange = { fg = "#c0b05f", bg = "#4E460C" },
          GitDelete = { fg = "#ff9095", bg = "#65161B" },
          Critical = { fg = "#ff0000" },
        }, --}}}
        signs = { --{{{
          add = "+",
          change = "~",
          delete = "x",
          error = "x",
          warn = "!",
          info = "?",
          hint = "*",
        }, --}}}
        border = { --{{{
          named = borders,
          floating = {
            borders.top_left,
            borders.top,
            borders.top_right,
            borders.right,
            borders.bottom_right,
            borders.bottom,
            borders.bottom_left,
            borders.left,
          },
          normal = {
            borders.top_left,
            borders.top,
            borders.top_right,
            borders.right,
            borders.bottom_right,
            borders.bottom,
            borders.bottom_left,
            borders.left,
          },
          telescope = {
            ivy = {
              borders.top,
              borders.right,
              borders.bottom,
              borders.left,
              borders.top_left,
              borders.top_right,
              borders.bottom_right,
              borders.bottom_left,
            },
          },
        }, --}}}
        ignored_fts = { -- {{{
          ui = {
            "MiniStarter",
            "NvimTree",
            "esqueleto.ivy.selection",
            "help",
            "loclist",
            "orgagenda",
            "packer",
            "qf",
            "quickfix",
            "starter",
            "terminal",
          },
        }, -- }}}
      }
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<C-k>", false, mode = { "i" } }
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
    end,
    opts = {
      codelens = {
        enabled = true,
      },
      diagnostics = {
        virtual_text = { current_line = true },
        -- virtual_lines = { current_line = true },
        -- underline = true,
      },
      format = { timeout_ms = 5000 },
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        -- rome = {
        --   root_dir = function(fname)
        --     return require("lspconfig").util.root_pattern("rome.json")(fname)
        --   end,
        --   mason = false,
        --   settings = {
        --     rome = {
        --       rename = true,
        --       -- requireConfiguration = true,
        --     },
        --   },
        -- },
        ansiblels = {},
        bashls = {},
        clangd = {},
        -- denols = {},
        cssls = {},
        dockerls = {},
        ruff_lsp = {},
        tailwindcss = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern(".git")(...)
          -- end,
        },
        -- tsserver = {
        --   root_dir = function(...)
        --     return require("lspconfig.util").root_pattern(".git")(...)
        --   end,
        --   single_file_support = false,
        --   settings = {
        --     typescript = {
        --       inlayHints = {
        --         includeInlayParameterNameHints = "literal",
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayVariableTypeHints = false,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayEnumMemberValueHints = true,
        --       },
        --     },
        --     javascript = {
        --       inlayHints = {
        --         includeInlayParameterNameHints = "all",
        --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --         includeInlayFunctionParameterTypeHints = true,
        --         includeInlayVariableTypeHints = true,
        --         includeInlayPropertyDeclarationTypeHints = true,
        --         includeInlayFunctionLikeReturnTypeHints = true,
        --         includeInlayEnumMemberValueHints = true,
        --       },
        --     },
        --   },
        -- },
        -- svelte = {},
        html = {},
        marksman = {},
        pyright = {
          enabled = false,
        },
        rust_analyzer = {
          -- settings = {
          --   ["rust-analyzer"] = {
          --     procMacro = { enable = true },
          --     cargo = { allFeatures = true },
          --     checkOnSave = {
          --       command = "clippy",
          --       extraArgs = { "--no-deps" },
          --     },
          --   },
          -- },
        },
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                  "vim",
                  "require",
                },
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
        vimls = {},
        vtsls = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern(".git")(...)
          -- end,
          single_file_support = false,
          settings = {
            typescript = {
              referencesCodeLens = {
                enabled = true,
              },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
            javascript = {
              referencesCodeLens = {
                enabled = true,
              },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
          },
        },
      },
      setup = {},
      hls = {},
    },
    -- init = function()
    --   local keys = require("lazyvim.plugins.lsp.keymaps").get()
    --   -- change a keymap
    --   -- disable a keymap
    --   keys[#keys + 1] = { "K", false }
    -- end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    ---@class PluginLspOpts
    opts = {
      ensure_installed = {
        "eslint@4.8.0",
        -- "eslint",
      },
      diagnostics = {
        -- float = { border = "rounded" },
        float = {
          source = false,
          border = "rounded",
          -- header = false,
          format = function(diagnostic)
            return string.format("%s: %s ", diagnostic.source or "", diagnostic.message)
          end,
        },
      },
      setup = {
        eslint = function()
          LazyVim.lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
      -- },
      -- setup = {
      --   eslint = function()
      --     local function get_client(buf)
      --       return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
      --     end
      --
      --     local formatter = require("lazyvim.util").lsp.formatter({
      --       name = "eslint: lsp",
      --       primary = false,
      --       priority = 200,
      --       filter = "eslint",
      --     })
      --
      --     -- Use EslintFixAll on Neovim < 0.10.0
      --     if not pcall(require, "vim.lsp._dynamic") then
      --       formatter.name = "eslint: EslintFixAll"
      --       formatter.sources = function(buf)
      --         local client = get_client(buf)
      --         return client and { "eslint" } or {}
      --       end
      --       formatter.format = function(buf)
      --         local client = get_client(buf)
      --         if client then
      --           local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
      --           if #diag > 0 then
      --             vim.cmd("EslintFixAll")
      --           end
      --         end
      --       end
      --     end
      --
      --     -- register the formatter with LazyVim
      --     require("lazyvim.util").format.register(formatter)
      --   end,
      -- },
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
          },
        },
      },
    },
    -- opts = {
    --   ---@type lspconfig.options
    --   servers = {
    --     -- tsserver will be automatically installed with mason and loaded with lspconfig
    --     tsserver = {},
    --   },
    --   -- you can do any additional lsp server setup here
    --   -- return true if you don't want this server to be setup with lspconfig
    --   ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    --   setup = {
    --     -- example to setup with typescript.nvim
    --     tsserver = function(_, opts)
    --       require("typescript").setup({ server = opts })
    --       return true
    --     end,
    --     -- Specify * to use this function as a fallback for any server
    --     -- ["*"] = function(server, opts) end,
    --   },
    -- },
  },
  -- { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.js-ts" },
  {
    "atusy/tsnode-marker.nvim",
    lazy = true,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("tsnode-marker-markdown", {}),
        pattern = "markdown",
        callback = function(ctx)
          require("tsnode-marker").set_automark(ctx.buf, {
            target = { "code_fence_content" }, -- list of target node types
            hl_group = "CursorLine", -- highlight group
          })
        end,
      })
    end,
  },
}
