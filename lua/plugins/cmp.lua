return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    event = "InsertEnter",
    version = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      { "hrsh7th/cmp-emoji", event = "InsertEnter" },
      -- {
      -- "tzachar/cmp-tabnine",
      -- build = {
      --   Util.is_win() and "pwsh -noni .\\install.ps1" or "./install.sh",
      --   ":CmpTabnineHub",
      -- },
      -- dependencies = "hrsh7th/nvim-cmp",
      --   opts = {
      --     max_lines = 1000,
      --     max_num_results = 3,
      --     sort = true,
      --   },
      --   config = function(_, opts)
      --     require("cmp_tabnine.config"):setup(opts)
      --   end,
      -- },
    },
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()

      local Util = require("lazyvim.util")

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end

      local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end

      local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
        cmp_sources = {
          nvim_lsp = "✨",
          luasnip = "🚀",
          buffer = "📝",
          path = "📁",
          cmdline = "💻",
          emoji = "😀",
          codeium = "",
        },
      }

      -- table.insert(opts.sources, 1, {
      --   name = "cmp_tabnine",
      --   group_index = 1,
      --   priority = 100,
      -- })

      -- opts.formatting.format = Util.inject.args(opts.formatting.format, function(entry, item)
      --   -- Hide percentage in the menu
      --   if entry.source.name == "cmp_tabnine" then
      --     item.menu = ""
      --   end
      -- end)
      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = "select" }),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif check_backspace() then
              fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        }),
        formatting = {
          -- fields = { "abbr", "kind", "menu" },
          fields = { "kind", "abbr", "menu" },
          kind_icons = kind_icons,
          format = function(entry, vim_item)
            -- Kind icons
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- vim_item.menu = ({
            --   nvim_lsp = "[LSP]",
            --   luasnip = "[Snippet]",
            --   buffer = "[Buffer]",
            --   path = "[Path]",
            -- })[entry.source.name]
            -- return vim_item
            local kind = string.lower(vim_item.kind)
            vim_item.kind = kind_icons[vim_item.kind] or "?"
            vim_item.abbr = vim_item.abbr:match("[^(]+")
            vim_item.menu = (kind_icons.cmp_sources[entry.source.name] or "") .. kind
            return vim_item
          end,
        },
        sources = {
          -- { name = "codeium" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "emoji" },
          -- { name = "cmp_tabnine" },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
          -- completion = cmp_window.bordered(),
          -- documentation = cmp_window.bordered(),
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
          -- ghost_text = true,
          native_menu = false,
        },
        duplicates = {
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
          luasnip = 1,
        },
        duplicates_default = 0,
      }
    end,
  },
}
