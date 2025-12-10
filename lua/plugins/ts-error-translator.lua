return {
  "dmmulroy/ts-error-translator.nvim",
  event = "VeryLazy",
  config = function()
    require("ts-error-translator").setup({
      auto_attach = true, -- auto-translate TS diagnostics
      servers = { "ts_ls", "vtsls", "astro", "svelte" },
    })
  end,
}
