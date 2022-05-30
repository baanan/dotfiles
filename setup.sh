#!/bin/bash

sudo apt update

# install zsh and oh-my-zsh
sudo apt install zsh -y
chsh -s /usr/bin/zsh

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
exec zsh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# install fonts
mkdir -p ~/Documents/utilities/ && cd "$_"
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts && cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono && ./install.sh JetBrainsMono
git sparse-checkout add patched-fonts/Hack && ./install.sh Hack

# install oh-my-posh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
echo "eval \"$(oh-my-posh init zsh --config ~/.config/omp/takuya.omp.json)\"" >> ~/.zshrc

# install other utilites
sudo apt install exa
sudo apt install ripgrep
sudo apt install fzf
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install languages
curl https://sh.rustup.rs -sSf | sh -s -- -y

# add zsh plugins
plugins="zsh-z zsh-autosuggestions"
sed -i -r "s/plugins\s*=\s*(\(\s*)((\w+ )*)(\w*\))/plugins=\1\2$plugins \4/g" ~/.zshrc

# copy over .config
cp -r .config/ ~/ 

cat .zprofile >> ~/.zprofile
cat .zshrc >> ~/.zshrc
cat .profile >> ~/.profile
