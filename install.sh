#!/bin/sh

echo Installing the packages...

$INSTALL eza
$INSTALL bat
$INSTALL zoxide
$INSTALL fzf
$INSTALL fd-find
$INSTALL vim
$INSTALL neovim
$INSTALL ssh
$INSTALL rsync

OMP='$HOME/.config/ohmyposh'
FONTS='$HOME/.local/share/fonts'
NVIM='$HOME/.config/nvim'

mkdir -p $NVIM
mkdir -p $OMP
mkdir -p $FONTS

cp wezterm/.wezterm.lua $HOME/
cp zsh/.zshrc $HOME/
cp ohmyposh/config.toml $OMP/
cp nvim/init.lua $NVIM/
cp fonts/*.otf $FONTS/
cp tmux/.tmux.conf $HOME/

echo All done !
