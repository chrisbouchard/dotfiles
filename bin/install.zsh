#!/bin/env zsh

# Install Homeshick (Shell-based Homesick replacement).
REPO_DIR=$HOME/.homesick/repos
mkdir -p $REPO_DIR
git clone https://github.com/andsens/homeshick.git $REPO_DIR/homeshick
source $REPO_DIR/homeshick/homeshick.sh

# Clone my dotfiles.
homeshick clone --batch chrisbouchard/dotfiles

# Clone other utilities that my dotfiles use (via symlink).
homeshick clone --batch robbyrussell/oh-my-zsh
homeshick clone --batch Shougo/dein.vim
homeshick clone --batch Tarrasch/zsh-bd
homeshick clone --batch tmux-plugins/tpm
homeshick clone --batch zsh-users/zsh-syntax-highlighting

# Install dotfiles via Homeshick.
homeshick link --force

