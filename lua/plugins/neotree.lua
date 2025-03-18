return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  enabled = false,
  lazy = true,
  config = function()
    local banned_messages =
      { "[Neo-tree INFO] No items, skipping git ignored/status lookups", "No information available" }
    -- local filter_notify = function(text, level, opts)
    --   for _, banned in ipairs(banned_messages) do
    --     if msg == banned then
    --       return
    --     end
    --   end
    --   -- require("notify")(msg, ...)
    --   orig_notify(text, level, opts)
    -- end
    -- vim.notify = filter_notify

    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            vim.cmd([[
          setlocal relativenumber
        ]])
          end,
        },
        {
          event = "notify",
          handler = function(msg, ...)
            for _, banned in ipairs(banned_messages) do
              if msg == banned then
                return
              end
            end
            require("notify")(msg, ...)
          end,
        },
      },
      window = {
        position = "right",
        -- width = 43,
        width = 60,
        mappings = {
          ["C-k"] = "prev_source",
          ["C-j"] = "next_source",
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ["<down>"] = "move_cursor_down",
          ["<C-j>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-k>"] = "move_cursor_up",
        },
      },
      popup_border_style = "rounded",
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            -- "node_modules",
            -- "build",
            "coverage",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
    })
  end,
}
