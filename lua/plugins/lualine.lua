local colors = require("ui.statusline.colors")
local fn = vim.fn

local function set_colors(fg, bg)
  return "guifg=" .. fg .. " guibg=" .. bg
end

local modes = {
  ["n"] = { "NORMAL", "StatusVimNormal" },
  ["niI"] = { "NORMAL i", "StatusVimNormal" },
  ["niR"] = { "NORMAL r", "StatusVimNormal" },
  ["niV"] = { "NORMAL v", "StatusVimNormal" },
  ["no"] = { "N-PENDING", "StatusVimNormal" },
  ["i"] = { "INSERT", "StatusVimInsert" },
  ["ic"] = { "INSERT", "StatusVimInsert" },
  ["ix"] = { "INSERT completion", "StatusVimInsert" },
  ["t"] = { "TERMINAL", "StatusVimTerm" },
  ["nt"] = { "NTERMINAL", "StatusVimTerm" },
  ["v"] = { "VISUAL", "StatusVimVisual" },
  ["V"] = { "V-LINE", "StatusVimVisual" },
  [""] = { "V-BLOCK", "StatusVimVisual" },
  ["R"] = { "REPLACE", "StatusVimReplace" },
  ["Rv"] = { "V-REPLACE", "StatusVimReplace" },
  ["s"] = { "SELECT", "StatusVimSelect" },
  ["S"] = { "S-LINE", "StatusVimSelect" },
  [""] = { "S-BLOCK", "StatusVimSelect" },
  ["c"] = { "COMMAND", "StatusVimCmd" },
  ["cv"] = { "COMMAND", "StatusVimCmd" },
  ["ce"] = { "COMMAND", "StatusVimCmd" },
  ["r"] = { "PROMPT", "StatusModified" },
  ["rm"] = { "MORE", "StatusModified" },
  ["r?"] = { "CONFIRM", "StatusModified" },
  ["!"] = { "SHELL", "StatusVimTerm" },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local api = vim.api
      api.nvim_command("hi StatusDefault " .. set_colors(colors.orange, colors.cyan))
      api.nvim_command("hi StatusVimNormal " .. set_colors(colors.bg, colors.magenta))
      api.nvim_command("hi StatusVimInsert " .. set_colors(colors.bg, colors.blue))
      api.nvim_command("hi StatusVimVisual " .. set_colors(colors.bg, colors.red))
      api.nvim_command("hi StatusVimReplace " .. set_colors(colors.bg, colors.dark_green))
      api.nvim_command("hi StatusVimEnter " .. set_colors(colors.bg, colors.yellow))
      api.nvim_command("hi StatusVimMore " .. set_colors(colors.bg, colors.violet))
      api.nvim_command("hi StatusVimSelect " .. set_colors(colors.bg, colors.green))
      api.nvim_command("hi StatusVimCmd " .. set_colors(colors.bg, colors.yellow))
      api.nvim_command("hi StatusVimShell " .. set_colors(colors.bg, colors.green))
      api.nvim_command("hi StatusVimTerm " .. set_colors(colors.bg, colors.bracket))
      api.nvim_command("hi StatusModified " .. set_colors(colors.bg, colors.magenta))
      api.nvim_command("hi StatusLineNumber " .. set_colors(colors.bg, colors.blue))
      api.nvim_command("hi StatusColumnNumber " .. set_colors(colors.bg, colors.red))
      api.nvim_command("hi StatusFileInfo " .. set_colors(colors.orange, colors.bg))
      api.nvim_command("hi StatusGitInfo " .. set_colors(colors.blue, colors.bg))
      api.nvim_command("hi StatusLSPProgress " .. set_colors(colors.cyan, colors.bg))
      api.nvim_command("hi StatusLSPError " .. set_colors(colors.red, colors.bg))
      api.nvim_command("hi StatusLSPWarn " .. set_colors(colors.orange, colors.bg))
      api.nvim_command("hi StatusLSPInfo " .. set_colors(colors.green, colors.bg))
      api.nvim_command("hi StatusLSPHin " .. set_colors(colors.magenta, colors.bg))
      api.nvim_command("hi StatusLSPStatus " .. set_colors(colors.cyan, colors.bg))
      api.nvim_command("hi StatusCwd " .. set_colors(colors.orange, colors.bg))
      api.nvim_command("hi StatusCursor " .. set_colors(colors.yellow, colors.bg))
      api.nvim_command("hi WhichKeyFloat " .. set_colors(colors.yellow, colors.bg))
      api.nvim_command("hi SessionName " .. set_colors(colors.green, colors.bg))

      return {
        options = {
          -- Disable sections and component separators
          component_separators = "",
          section_separators = "",
          theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            -- normal = { c = { fg = colors.fg, bg = colors.base1 } },
            -- inactive = { c = { fg = colors.fg, bg = colors.base1 } },
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {
            {
              function()
                local m = vim.api.nvim_get_mode().mode
                local current_mode = "%#" .. modes[m][2] .. "#" .. "  " .. modes[m][1] .. " "
                return current_mode .. "%#ST_EmptySpace#"
              end,
              padding = { right = 0 },
            },
          },
          lualine_b = {
            {
              function()
                local icon = "  "
                local filename = (fn.expand("%") == "" and "Empty ") or fn.expand("%:t")

                if filename ~= "Empty " then
                  local devicons_present, devicons = pcall(require, "nvim-web-devicons")

                  if devicons_present then
                    local ft_icon = devicons.get_icon(filename)
                    icon = (ft_icon ~= nil and " " .. ft_icon) or ""
                  end

                  filename = " " .. filename .. " "
                end

                return "%#StatusFileInfo#" .. icon .. filename .. "%#St_file_sep#"
              end,
              padding = { left = 0 },
            },
          },
          lualine_c = {
            {
              function()
                if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
                  return ""
                end

                local git_status = vim.b.gitsigns_status_dict

                local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
                local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed)
                  or ""
                local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed)
                  or ""
                local branch_name = "   " .. git_status.head .. " "

                return "%#StatusGitInfo#" .. branch_name .. added .. changed .. removed
              end,
              function()
                local status, result = pcall(require("lazy.status").updates)
                if status then
                  if result then
                    return result.has_updates
                  end
                end
                return ""
              end,
            },
            {
              'vim.fn["codeium#GetStatusString"]()',
              fmt = function(str)
                return "" .. "  Suggestions " .. str:lower():match("^%s*(.-)%s*$")
                -- return "" .. "  Suggestions " .. str:match("^%s*(.-)%s*$")
              end,
              color = { fg = "#58f5ab" },
            },
          },
          lualine_x = {},
          lualine_y = {
            "%=",
            -- function()
            --   if not rawget(vim, "lsp") then
            --     return ""
            --   end
            --
            --   local Lsp = vim.lsp.util.get_progress_messages()[1]
            --
            --   if vim.o.columns < 120 or not Lsp then
            --     return ""
            --   end
            --
            --   local msg = Lsp.message or ""
            --   local percentage = Lsp.percentage or 0
            --   local title = Lsp.title or ""
            --   local spinners = { "", "" }
            --   local ms = vim.loop.hrtime() / 1000000
            --   local frame = math.floor(ms / 120) % #spinners
            --   local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
            --
            --   return ("%#StatusLSPProgress#" .. content) or ""
            -- end,
            -- "%=",
            function()
              if not rawget(vim, "lsp") then
                return ""
              end

              local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
              local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
              local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
              local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

              errors = (errors and errors > 0) and ("%#StatusLSPError#" .. " " .. errors .. " ") or ""
              warnings = (warnings and warnings > 0) and ("%#StatusLSPWarn#" .. "  " .. warnings .. " ") or ""
              hints = (hints and hints > 0) and ("%#StatusLSPHin#" .. "ﯧ " .. hints .. " ") or ""
              info = (info and info > 0) and ("%#StatusLSPInfo#" .. " " .. info .. " ") or ""

              return errors .. warnings .. hints .. info
            end,
            function()
              if rawget(vim, "lsp") then
                for _, client in ipairs(vim.lsp.get_active_clients()) do
                  if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                    return (vim.o.columns > 100 and "%#StatusLSPStatus#" .. "   LSP ~ " .. client.name .. " ")
                      or "   LSP "
                  end
                end
              end
            end,
            -- function()
            --   local left_sep = "%#sessionname#" .. " "
            --   local status, result = pcall(require("auto-session-library").current_session_name)
            --   local session_name = "no session"
            --   if status then
            --     session_name = result
            --   end
            --   return left_sep .. "%#sessionname#" .. " " .. session_name .. " "
            -- end,
          },
          lualine_z = {
            function()
              local dir_icon = "%#statuscwd#" .. "  "
              local dir_name = "%#statuscwd#" .. " " .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
              return (vim.o.columns > 85 and (dir_icon .. dir_name)) or ""
            end,
            function()
              local left_sep = "%#statuscursor#" .. "  "

              local current_line = fn.line(".")
              local total_line = fn.line("$")
              local text = math.modf((current_line / total_line) * 100) .. tostring("%%")

              text = (current_line == 1 and "top") or text
              text = (current_line == total_line and "bot") or text

              return left_sep .. "%#statuscursor#" .. " " .. text .. " "
            end,
          },
        },
      }
    end,
  },
  -- { "rmagatti/auto-session" },
}
