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

curl -s https://ohmyposh.dev/install.sh | bash -s

OMP=$HOME'/.config/ohmyposh'
FONTS=$HOME'/.local/share/fonts'
NVIM=$HOME'/.config/nvim'

FILE=$NVIM'/init.vim'
if test -f "$FILE"; then
    mv $FILE $NVIM/'init.vim.bak'
fi

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
