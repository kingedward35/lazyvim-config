return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    enabled = true,
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- add blink.compat to dependencies
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
      {
        "moyiz/blink-emoji.nvim",
      },
    },
    version = not vim.g.lazyvim_blink_main and "*",
    -- version = "v0.*", -- REQUIRED release tag to download pre-built binaries
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat",
      "sources.default",
    },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      snippets = {
        expand = function(snippet, _)
          return LazyVim.cmp.expand(snippet)
        end,
      },
      completion = {
        menu = {
          enabled = true,
          min_width = 15,
          max_height = 10,
          border = "rounded",
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          draw = {
            padding = { 1, 2 },
            columns = {
              { "kind_icon", gap = 1 },
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
            components = {
              kind_icon = { width = { fill = true } },
            },
          },
        },
        documentation = {
          -- Controls whether the documentation window will automatically show when selecting a completion item
          auto_show = true,
          -- Delay before showing the documentation window
          auto_show_delay_ms = 500,
          -- Delay before updating the documentation window when selecting a new item,
          -- while an existing item is still visible
          update_delay_ms = 50,
          -- Whether to use treesitter highlighting, disable if you run into performance issues
          treesitter_highlighting = true,
          window = {
            min_width = 10,
            max_width = 60,
            max_height = 20,
            border = "rounded",
            winblend = 0,
            -- winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
            -- Note that the gutter will be disabled when border ~= 'none'
            scrollbar = true,
            -- Which directions to show the documentation window,
            -- for each of the possible menu window directions,
            -- falling back to the next direction when there's not enough space
            direction_priority = {
              menu_north = { "e", "w", "n", "s" },
              menu_south = { "e", "w", "s", "n" },
            },
          },
        },
      },
      -- sources = {
      --   providers = {
      --     { "blink.cmp.sources.lsp", name = "LSP" },
      --     { "blink.cmp.sources.snippets", name = "Snippets", score_offset = -1 },
      --     {
      --       "blink.cmp.sources.path",
      --       name = "Path",
      --       score_offset = 3,
      --       opts = { get_cwd = vim.uv.cwd },
      --     },
      --     {
      --       "blink.cmp.sources.buffer",
      --       name = "Buffer",
      --       keyword_length = 3,
      --       fallback_for = { "LSP" }, -- PENDING https://github.com/Saghen/blink.cmp/issues/122
      --     },
      --   },
      -- },
      sources = {
        -- adding any nvim-cmp sources here will enable them
        -- with blink.compat
        compat = {},
        default = { "lsp", "path", "snippets", "buffer", "emoji" },
        cmdline = require("blink.cmp.config.sources").default.cmdline,
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15, -- Tune by preference
          },
        },
      },
      keymap = {
        preset = "default",
        ["<Enter>"] = {},
        ["<CR>"] = {},
        ["<C-y>"] = { "accept" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
      cmdline = {
        keymap = {
          preset = "default",
          ["<Enter>"] = {},
          ["<CR>"] = {},
          ["<C-y>"] = { "accept" },
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
        },
      },
      appearance = {
        highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = false,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
        kind_icons = {
          Text = "󰉿",
          Method = "m",
          Function = "󰊕",
          Constructor = "",
          Field = "",
          Variable = "󰆦",
          Class = "󰊲",
          Interface = "",
          Module = "",
          Property = "",
          Unit = "",
          Value = "󱀍 ",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "",
          File = "󰈔",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "󰅫",
          Struct = "",
          Event = "",
          Operator = " ",
          TypeParameter = " ",
          -- cmp_sources = {
          --   nvim_lsp = "✨",
          --   luasnip = "🚀",
          --   buffer = "📝",
          --   path = "📁",
          --   cmdline = "💻",
          --   emoji = "😀",
          --   codeium = "",
          -- },
        },
      },
    },
  },
}
