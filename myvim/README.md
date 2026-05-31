# Neovim Config

Personal Neovim configuration

## Requirements

- Neovim `>= 0.12` (uses `vim.lsp.config`)
- [Git](https://git-scm.com/) executable. Assumed to be named `git`
- A Nerd Font (config enables icon support)
- Optional but recommended:
  - `ripgrep` & `fd` (for live grep picker)
  - language toolchains you use (Go, UV, Python, etc.)
  - Terminal emulator (or GUI) with **true colors** and **Nerd Fort icons** support

## Install

1. Backup your current config (optional):

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone this config
3. Start Neovim:

```sh
nvim
```

On first launch, `lazy.nvim` bootstraps automatically, then installs plugins.

## LSP And Formatter Setup

This config uses:

- `mason.nvim`
- `mason-lspconfig.nvim`
- built-in Neovim LSP (`nvim-lspconfig`)
- `conform.nvim` for formatting

Configured servers/tools are auto-installed via Mason:

- LSP: `lua_ls`, `gopls`, `tsgo`, `ruff`, `pyrefly`
- Format/lint tools: `stylua`, `oxfmt`, `oxlint`

## Plugins

### Plugin Manager

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

### UI / Theme

- [catppuccin/nvim](https://github.com/catppuccin/nvim)
- [nvim-mini/mini.icons](https://github.com/nvim-mini/mini.icons)
- [nvim-mini/mini.statusline](https://github.com/nvim-mini/mini.statusline)
- [nvim-mini/mini.starter](https://github.com/nvim-mini/mini.starter)

### Navigation / Picker / Files

- [nvim-mini/mini.pick](https://github.com/nvim-mini/mini.pick)
- [nvim-mini/mini.extra](https://github.com/nvim-mini/mini.extra)
- [nvim-mini/mini.files](https://github.com/nvim-mini/mini.files)

### Editing

- [nvim-mini/mini.ai](https://github.com/nvim-mini/mini.ai)
- [nvim-mini/mini.pairs](https://github.com/nvim-mini/mini.pairs)
- [nvim-mini/mini.keymap](https://github.com/nvim-mini/mini.keymap)
- [nvim-mini/mini.completion](https://github.com/nvim-mini/mini.completion)
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

### Git

- [nvim-mini/mini-git](https://github.com/nvim-mini/mini-git)
- [nvim-mini/mini.diff](https://github.com/nvim-mini/mini.diff)

### Syntax / Parsing

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

### LSP / Tooling

- [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim)
- [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

### Core Mini Pack

- [nvim-mini/mini.nvim](https://github.com/nvim-mini/mini.nvim)

## Useful Keymaps

- `<leader>ff` file picker
- `<leader>fg` live grep
- `<leader>fb` buffer picker
- `<leader>e` file explorer (`mini.files`)
- `<leader>cf` format current buffer/selection
- `<leader>gb` git blame split
- `<leader>gB` git history at cursor
- `<C-s>` save file

## Notes

- `netrw` is disabled in favor of `mini.files`.
- Config is split by concern:
  - `lua/config/*` for base options/keymaps/autocmds
  - `lua/plugins/*` for plugin specs
  - `lua/lsp/*` for LSP server configuration

## Inspiration

This project inspired by:

- [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)
- [nvim-mini/MiniMax](https://github.com/nvim-mini/MiniMax)
