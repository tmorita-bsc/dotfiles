#!/bin/bash

# dein
## need pyenv(3.6~) or python3 for neovim
## if need install dein, exec "./init_env.sh dein" instead of "./init_env.sh"
ARG=$1
if [ -n "$ARG" ] && [ $ARG = "dein" ] ; then
  mkdir ~/.cache
  mkdir ~/.cache/dein
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh ./installer.sh ~/.cache/dein
  rm installer.sh
fi

# vim
mkdir ~/.cache/dein/toml_dir
## need set python3 config .vimrc
ln -sf ~/dotfiles/vimrc     ~/.vimrc
ln -sf ~/dotfiles/vim_cheat_sheet ~/.vim_cheat_sheet.md
ln -sf ~/dotfiles/toml_dir/plugins.toml       ~/.cache/dein/toml_dir/plugins.toml
ln -sf ~/dotfiles/toml_dir/plugins_lazy.toml  ~/.cache/dein/toml_dir/plugins_lazy.toml
ln -sf ~/.cache/dein/toml_dir/plugins.toml        ~/.plugins.toml
ln -sf ~/.cache/dein/toml_dir/plugins_lazy.toml   ~/.plugins_lazy.toml

# zsh
ln -sf ~/dotfiles/zprofile  ~/.zprofile
ln -sf ~/dotfiles/zshrc     ~/.zshrc
ln -sf ~/dotfiles/zshenv    ~/.zshenv
ln -sf ~/dotfiles/zhistory  ~/.zhistory

# git
ln -sf ~/dotfiles/gitignore ~/.gitignore
ln -sf ~/dotfiles/gitconfig ~/.gitconfig

# tmux
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

# flake8
ln -sf ~/dotfiles/tox.ini ~/tox.ini


