return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
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
      require("lspconfig.ui.windows").default_options.border = "rounded"
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    opts = {
      format = { timeout_ms = 5000 },
      inlay_hints = { enabled = true },
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
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
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
      },
      setup = {},
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
      servers = { eslint = {} },
      --   setup = {
      --     eslint = function()
      --       require("lazyvim.util").lsp.on_attach(function(client)
      --         if client.name == "eslint" then
      --           client.server_capabilities.documentFormattingProvider = true
      --         elseif client.name == "tsserver" then
      --           client.server_capabilities.documentFormattingProvider = false
      --         end
      --       end)
      --     end,
      --   },
      -- },
      setup = {
        eslint = function()
          local function get_client(buf)
            return require("lazyvim.util").lsp.get_clients({ name = "eslint", bufnr = buf })[1]
          end

          local formatter = require("lazyvim.util").lsp.formatter({
            name = "eslint: lsp",
            primary = false,
            priority = 200,
            filter = "eslint",
          })

          -- Use EslintFixAll on Neovim < 0.10.0
          if not pcall(require, "vim.lsp._dynamic") then
            formatter.name = "eslint: EslintFixAll"
            formatter.sources = function(buf)
              local client = get_client(buf)
              return client and { "eslint" } or {}
            end
            formatter.format = function(buf)
              local client = get_client(buf)
              if client then
                local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end
          end

          -- register the formatter with LazyVim
          require("lazyvim.util").format.register(formatter)
        end,
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
