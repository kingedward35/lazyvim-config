return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- format_on_save = {
    --   timeout_ms = 10000,
    --   async = false, -- not recommended to change
    --   quiet = false, -- not recommended to change
    --   lsp_fallback = true, -- not recommended to change
    -- },
    formatters_by_ft = {
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "prettier" },
      -- css = { "prettier" },
      -- html = { "prettier" },
      -- json = { "prettier" },
      -- yaml = { "prettier" },
      -- markdown = { "prettier" },
      -- graphql = { "prettier" },
      lua = { "stylua" },
    },
  },
}
