# Dotfiles

Personal dotfiles and configuration files: shell, editor, terminal and AI coding tools.

## Layout

```
fonts/        Nerd Fonts (Liga SFMono Nerd Font)
nvim/         Neovim config (lazy.nvim, see nvim/README.md)
ohmyposh/     Oh My Posh prompt config
tmux/         tmux config
wezterm/      WezTerm config
zsh/          zsh config (.zshrc)
install.sh    one-shot installation script
```

## Install

Use the install script. It copies the configs to their destinations and installs the base packages.

### 1. Set your package manager

Install script uses `$INSTALL` to install packages, so set it for your distro first:

```bash
# apt-based distros (Debian, Ubuntu)
export INSTALL='sudo apt install'

# pacman-based distros (Arch, Manjaro)
export INSTALL='sudo pacman -S'

# dnf-based distros (Fedora)
export INSTALL='sudo dnf install'
```

### 2. Run

```bash
git clone <your-repo>
cd config_files
chmod +x install.sh && ./install.sh
```

The script installs: eza, bat, zoxide, fzf, fd-find, vim, neovim, ssh, rsync, Oh My Posh, the Nerd Fonts, and copies the zsh, wezterm, tmux, ohmyposh, and nvim configs.

Afterwards, some components need manual setup:

- **Oh My Posh / zsh**: start a new shell (`zsh` or re-login); oh-my-posh needs its init line in `.zshrc` (already included by the copied `.zshrc`).
- **Neovim**: run `nvim` once — plugins and language servers install automatically on first launch, then run `:checkhealth`. Details in `nvim/README.md`.

Or install everything one by one, starting with fonts, then ohmyposh, zshrc and the rest.
