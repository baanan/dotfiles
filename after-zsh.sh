#!/bin/zsh
dir=$PWD

# establish Documents folder structure
mkdir -p ~/Documents/{utilities,projects,executables}

# install homebrew
/bin/bash -c "NONINTERACTIVE=true && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

# install fonts
cd ~/Documents/utilities/
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts && cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono && ./install.sh JetBrainsMono
git sparse-checkout add patched-fonts/Hack && ./install.sh Hack

# install languages
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# install bat
sudo apt install bat
if [ -f "/usr/bin/batcat" ]; then
    mkdir -p ~/.local/bin
    ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# install other utilites
sudo apt install exa
cargo install git-delta

sudo apt install ripgrep
sudo apt install fzf
cargo install fd-find

sudo apt install mold
sudo apt install clang

brew install jandedobbeleer/oh-my-posh/oh-my-posh
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# add zsh plugins
plugins="zsh-z zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search"
sed -i -r "s/plugins\s*=\s*(\(\s*)((\w+ )*)(\w*\))/plugins=\1\2$plugins \4/g" ~/.zshrc

# copy over .config
## replace with below once ripgrep issue 2020 is fixed
## rg --multiline --multiline-dotall --passthru "\[start\].*\[end\]" -r "[start]${cat .zshrc}[end]" ~/.zshrc > ~/.zshrc
cd $dir

cp -r config/ ~/ 

cat home/.zshrc >> ~/.zshrc
cat home/.gitconfig >> ~/.gitconfig
cat home/cargo-config.toml >> ~/.cargo/config.toml
