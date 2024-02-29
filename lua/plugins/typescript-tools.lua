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
