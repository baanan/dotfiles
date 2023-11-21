#!/bin/zsh

# make sure you start in the correct directory
dir=$PWD
cd `pwd | grep -o "^.*dotfiles"`/common/neovim

# install neovim
brew install neovim

# install other dependencies
sudo nala install ripgrep -y
sudo nala install universal-ctags -y
sudo nala install xclip -y
brew install jesseduffield/lazygit/lazygit

# sudo apt install python3-pip -y
# python3 -m pip install --user --upgrade pynvim
sudo nala install python3-neovim

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
	# install dependencies
	sudo apt install -y curl \
	    gnupg ca-certificates git \
	    gcc-multilib g++-multilib cmake libssl-dev pkg-config \
	    libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
	    libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
	    libxcursor-dev
	# install neovide itself
	cargo install --git https://github.com/neovide/neovide
	# add NEOVIDE_MULTIGRID environment variable
	echo export NEOVIDE_MULTIGRID=true >> ~/.zshenv
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
cp -r config ~/.config/nvim

# set up global gitignore
git config --global core.excludesFile '~/.gitignore'
cat home/.gitignore >> ~/.gitignore

# go back to original dir
cd $dir
