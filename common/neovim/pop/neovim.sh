#!/bin/zsh

# TODO: bacon

# make sure you start in the correct directory
cd `pwd | grep -o "^.*dotfiles"`/common/neovim

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
sudo nala install ripgrep
sudo nala install universal-ctags
sudo nala install xclip
brew install jesseduffield/lazygit/lazygit

sudo apt install python3-pip
python3 -m pip install --user --upgrade pynvim

# bacon
cargo install --locked bacon
if ! rg -q "^export_locations" $(bacon --prefs); then 
	sed -i '1s/^/export_locations = true\n/' $(bacon --prefs)
fi

# ueberzug
# sudo apt install libx11-dev
# sudo apt-get install libxext-dev
# pip install ueberzug

# neovide
echo "Install Neovide?"
read a

if [[ $a =~ "^y" ]]; then
	# install 0.9.0
	wget https://github.com/neovide/neovide/releases/download/0.9.0/neovide.tar.gz
	tar --gunzip -xf neovide.tar.gz
	mv target/release/neovide ~/Documents/executables/neovide
	# cleanup
	rm neovide.tar.gz
	rm -r target
fi

echo "Install Node.js?"
read a

if [[ $a =~ "^y" ]]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	nvm install node
fi

npm install --location=global neovim

# copy over config
cp -r config/* ~/.config/

# install plugins
# nvim --headless +PlugInstall +qa

echo "Install Coc Plugins?"
read a

if [[ $a =~ "^y" ]]; then
	nvim "+CocInstall coc-rust-analyzer coc-sumneko-lua coc-vimlsp coc-java coc-sh coc-json coc-snippets"
fi
