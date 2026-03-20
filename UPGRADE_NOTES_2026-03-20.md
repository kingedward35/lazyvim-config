# Neovim plugin update prep

Prepared on 2026-03-20 for these plugins:
- catppuccin
- nvim-lspconfig
- nvim-surround
- nvim-treesitter

## Local repo state
- Branch: `chore/nvim-plugin-updates-2026-03-20`
- Neovim: `v0.11.5`

## Prep applied
- `nvim-surround` is constrained to `^4.0.0` so the next update targets the current major release explicitly.
- `nvim-treesitter` now has `build = ":TSUpdate"` and `lazy = false` to match current upstream guidance.

## Package notes

### catppuccin
- No repo-specific migration work found yet.
- This config is currently using `tokyodark`, not `catppuccin`, so the update risk is low unless you switch themes.

### nvim-lspconfig
- This repo already uses LazyVim/LSP opts instead of `require("lspconfig").<server>.setup(...)`, which aligns with the current migration direction.
- If we later add custom standalone configs, prefer `vim.lsp.config(...)` and `vim.lsp.enable(...)`.

### nvim-surround
- Current custom config should continue to work on v4.
- The notable upstream behavior change is around repeat operations introduced in v3.

### nvim-treesitter
- Main branch is now an incompatible rewrite.
- Upstream currently says the latest `main` branch needs Neovim `0.12.0` or later, while this repo is on `0.11.5`.
- If you want the newest `main`, Neovim itself needs to be upgraded first. Otherwise we should treat the backward-compatible `master` branch as the safe target.
- Parser updates are required alongside plugin updates.
- If anything breaks after the update, first run `:TSUpdate`.

## Suggested next step
When you want, I can update the lockfile for just these plugins, start Neovim headlessly, and fix any breakages that show up in this config.
