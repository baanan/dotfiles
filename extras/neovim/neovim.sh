#!/bin/zsh

# install neovim
# sudo apt install neovim
echo "Install Neovim?"
read a

if [[ $a =~ "^y" ]]; then
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
	sudo apt install ./nvim-linux64.deb
	rm ./nvim-linux64.deb
fi

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install other dependencies
sudo apt install ripgrep
sudo apt install fzf

# copy over config
cp -r config/* ~/.config/

# install plugins
nvim --headless +PlugInstall +qa
