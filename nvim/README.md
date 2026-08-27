# Neovim Configuration

A personal Neovim configuration for Neovim 0.11+ with lazy-loading, LSP support, and a VSCode-inspired Gruvbox Dark Hard theme.

## Installation

### 1. Prerequisites

- Neovim 0.11+
- A [Nerd Font](https://www.nerdfonts.com/) set as your terminal font
- Optional CLI tools: `git`, `ripgrep`, `fd`, `lazygit`

### 2. Install

```bash
# Backup any existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this config
git clone <your-repo> ~/.config/nvim

# Start Neovim - plugins and language tools auto-install on first launch
nvim
```

After first launch run `:checkhealth` to verify everything works.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── core/
│   │   ├── init.lua         # Loads all core modules
│   │   ├── options.lua      # Neovim options
│   │   ├── colors.lua       # VSCode Gruvbox Dark Hard overrides
│   │   ├── keymaps.lua      # Core keybindings
│   │   ├── autocmds.lua     # Auto commands
│   │   ├── lazy.lua         # Plugin manager bootstrap
│   │   └── utils.lua        # Utility functions
│   └── plugins/
│       ├── coding.lua       # Completion, treesitter, comments
│       ├── colorschemes.lua # Gruvbox Material theme
│       ├── editor.lua       # Flash, mini.nvim, persistence
│       ├── formatting.lua   # Conform.nvim (ruff)
│       ├── git.lua          # Gitsigns, diffview
│       ├── lsp.lua          # LSP + Mason
│       ├── snacks.lua       # Picker, explorer, notifications
│       └── ui.lua           # Which-key, diagnostics, markdown, trouble
```

## Features

- **Theme**: Gruvbox Material (hard) with custom VSCode-aligned colors (`lua/core/colors.lua`)
- **Completion**: blink.cmp with LSP, path, buffer, and snippet sources
- **LSP**: Managed via Mason — lua_ls, ts_ls, bashls, cssls, html, jsonls, yamlls
- **Python**: Linting via the **ruff** LSP, type checking via **ty**, formatting via **conform.nvim** (ruff format + fix on save)
- **Diagnostics**: Inline virtual text via tiny-inline-diagnostic, gutter signs, `<leader>dd`/`<leader>db` picker, `<leader>dt` Trouble list
- **Navigation**: Snacks picker (files, grep, buffers, git), flash.nvim, mini.ai text objects
- **Git**: gitsigns signs + hunks, diffview, lazygit via Snacks

## Keybindings

**Leader key:** `<Space>`

### Essential

| Key | Action |
|-----|--------|
| `<C-s>` | Save file |
| `<C-h/j/k/l>` | Navigate windows |
| `<C-Up/Down/Left/Right>` | Resize windows |
| `<Esc>` | Clear search highlight |
| `jk` | Exit insert mode |
| `H` / `L` | Start/End of line |
| `<S-h>` / `<S-l>` | Prev/Next buffer |
| `Q` | Delete buffer |
| `K` | Hover documentation |
| `s` / `S` | Flash jump / treesitter |
| `]d` / `[d` | Next/Prev diagnostic |

### Leader maps

| Prefix | Group |
|--------|-------|
| `<leader><space>` / `<leader>/` | Find files / Grep |
| `<leader>,` / `<leader>.` / `<leader>e` | Buffers / Scratch / Explorer |
| `<leader>b` | Buffers |
| `<leader>c` | Code (actions, rename, format, diagnostics) |
| `<leader>d` | Diagnostics |
| `<leader>f` | Files |
| `<leader>g` | Git (lazygit, log, status, browse) |
| `<leader>l` | LSP |
| `<leader>m` | Markdown (preview, render) |
| `<leader>n` | Notifications |
| `<leader>s` | Search (grep, symbols, help, buffers, etc.) |
| `<leader>u` | UI toggles (spell, wrap, colorschemes, zen) |
| `<leader>w` | Windows |
| `gd` `gD` `gr` `gi` `gy` | LSP goto |

### Diagnostics (`<leader>d`)

| Key | Action |
|-----|--------|
| `<leader>dd` | Workspace diagnostics |
| `<leader>db` | Buffer diagnostics |
| `<leader>dt` | Trouble (workspace) |
| `<leader>dT` | Trouble (buffer) |
| `<leader>dq` | Quickfix list |
| `<leader>dl` | Location list |
| `]d` / `[d` | Next/Prev diagnostic |

## Python Tooling

- **Linting**: ruff LSP (errors/warnings shown as diagnostics)
- **Type checking**: ty LSP
- **Formatting**: conform.nvim runs `ruff format` + `ruff fix` on save (`<leader>cf` to format manually)
- **Project config**: ruff discovers `ruff.toml` / `.ruff.toml` / `pyproject.toml` by walking up from the file
- **Suppressing ty errors**: `# ty: ignore[invalid-argument-type]` at end of the line

Always a WIP.