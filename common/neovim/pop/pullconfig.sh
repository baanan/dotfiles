#!/bin/zsh

# pull config from .config

# center self in the correct directory
dir=$PWD
cd $(pwd | grep -o "^.*dotfiles")/common/neovim

# replace the config
rm -r config
cp -r ~/.config/nvim config

# go back to original directory
cd $dir
