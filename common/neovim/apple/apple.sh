#!/bin/zsh

# make sure you start in the correct directory
cd `pwd | grep -o "^.*dotfiles"`/common/neovim

# install neovim
brew tap jason0x43/homebrew-neovim-nightly
brew install neovim-nightly

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install other dependencies
brew install ripgrep
brew install universal-ctags
brew install jesseduffield/lazygit/lazygit
cargo install --locked bacon

brew install npm
sudo npm install --location=global neovim
python3 -m pip install --user --upgrade pynvim

# ueberzug
# sudo apt install libx11-dev
# sudo apt-get install libxext-dev
# pip install ueberzug

# neovide
brew install neovide
cat 'NEOVIDE_MULTIGRID="true"' >> ~/.zshrc

# copy over config
cp -r config ~/.config/nvim
