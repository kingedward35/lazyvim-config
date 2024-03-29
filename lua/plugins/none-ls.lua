return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        -- nls.builtins.formatting.prettierd,
        nls.builtins.formatting.stylua,
        -- nls.builtins.diagnostics.flake8,
        -- nls.builtins.formatting.eslint_d,
      },
    }
  end,
}
