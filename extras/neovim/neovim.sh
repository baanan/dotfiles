#!/bin/zsh

# install neovim
# sudo apt install neovim
echo "Install Neovim Itself?"
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
sudo apt install universal-ctags
sudo apt install xclip
sudo npm install --location=global neovim

sudo apt install python3-pip
python3 -m pip install --user --upgrade pynvim

echo "Install Node.js?"
read a

if [[ $a =~ "^y" ]]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	nvm install node
fi

# copy over config
cp -r config/* ~/.config/

# install plugins
nvim --headless +PlugInstall +qa

echo "Install Coc Plugins?"
read a

if [[ $a =~ "^y" ]]; then
	nvim "+CocInstall coc-rust-analyzer coc-sumneko-lua coc-vimlsp coc-java coc-sh coc-json coc-snippets"
fi
