#!/bin/zsh

# install neovim
sudo apt install neovim

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install other dependencies
sudo apt install ripgrep
sudo apt install fzf

# copy over config
cp config/* ~/.config/
