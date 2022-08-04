#!/bin/zsh
dir=$PWD

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# establish Documents folder structure
mkdir -p ~/Documents/{utilities,projects,executables}

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font

# install languages
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
brew install java
# python?

# install other utilites
brew install bat
brew install exa
brew install git-delta
brew install btop

brew install ripgrep
brew install fzf
brew install fd
brew install gnu-sed
brew install 7zip

brew install mold
# sudo apt install clang

# apple-specific stuff
brew install --cask background-music
brew install iterm2

brew install jandedobbeleer/oh-my-posh/oh-my-posh
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# add zsh plugins
plugins="zsh-z zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search"
gsed -i -r "s/plugins\s*=\s*(\(\s*)((\w+ )*)(\w*\))/plugins=\1\2$plugins \4/g" ~/.zshrc

# copy over .config
## replace with below once ripgrep issue 2020 is fixed
## rg --multiline --multiline-dotall --passthru "\[start\].*\[end\]" -r "[start]${cat .zshrc}[end]" ~/.zshrc > ~/.zshrc
cd $dir

cp -r config/* ~/.config/
cp -r apple/Preferences/* ~/Library/Preferences/

cat home/.zshrc >> ~/.zshrc
cat "alias 7z=7zz" >> ~/.zshrc
cat home/.gitconfig >> ~/.gitconfig
cat home/cargo-config.toml >> ~/.cargo/config.toml
