return {
  "nvimtools/none-ls.nvim",
  -- event = "BufReadPre",
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls-extras.nvim",
    "mason.nvim",
    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
    -- "hrsh7th/nvim-cmp",
    -- "folke/neoconf.nvim",
    -- "folke/neodev.nvim",                                                                                                                                            │
    -- "mxsdev/nvim-dap-vscode-js",
    -- "vuki656/package-info.nvim",
    -- "atusy/tsnode-marker.nvim"
  },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        -- nls.builtins.formatting.prettierd,
        nls.builtins.formatting.stylua,
        require("none-ls.diagnostics.eslint_d"),
        -- require("none-ls.formatting.eslint"),
        -- nls.builtins.diagnostics.flake8,
        -- nls.builtins.formatting.eslint_d,
        -- nls.builtins.diagnostics.eslint,
      },
    }
  end,
}
