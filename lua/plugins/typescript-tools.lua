return {
  "pmizio/typescript-tools.nvim",
  ft = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
      -- expose_as_code_action = { "fix_all", "add_missing_imports", "remove_unused" },
      expose_as_code_action = "all",
      code_lens = "on",
    },
    handlers = {
      -- because I don't want to format on save via typescript-tools
      -- prefer other tools over typescript formatting
      ["textDocument/formatting"] = true,
      ["textDocument/rangeFormatting"] = true,
      ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        require("ts-error-translator").translate_diagnostics(err, result, ctx, config)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
      end,
    },
  },
}
