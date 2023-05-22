#!/bin/zsh
dir=$PWD

# establish Documents folder structure
mkdir -p ~/Documents/{utilities,projects,executables,scripts}

# install nala
sudo apt install nala
sudo nala fetch --auto

# install homebrew
/bin/bash -c "NONINTERACTIVE=true && $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
# test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.profile

# install fonts
mkdir ~/.local/share/fonts/iosevka-nerd
cp ../common/iosevka/iosevka-nerd-font/* ~/.local/share/fonts/iosevka-nerd
#   nerd fonts
cd ~/Documents/utilities/
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts && cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono && ./install.sh JetBrainsMono
git sparse-checkout add patched-fonts/Hack && ./install.sh Hack


# install languages
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
sudo nala install default-jre
sudo nala install python3-pip
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node

# install bat
sudo nala install bat
if [ -f "/usr/bin/batcat" ]; then
    mkdir -p ~/.local/bin
    sudo ln -s /usr/bin/batcat /usr/bin/bat
fi

# install other utilites
sudo nala install exa
cargo install git-delta
sudo nala install btop

sudo nala install ripgrep
sudo nala install fzf
cargo install fd-find
cargo install sd

sudo nala install mold
sudo nala install clang

brew install jandedobbeleer/oh-my-posh/oh-my-posh
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
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

# pop-specific config
cp -r config/* ~/.config/

cd ../common/

# generic config
cp -r config/* ~/.config/ 

cat home/.zshrc >> ~/.zshrc
cat home/.gitconfig >> ~/.gitconfig
cat home/cargo-config.toml >> ~/.cargo/config.toml
cat home/.profile >> ~/.profile

# setup global gitignore
git config --global core.excludesFile '~/.gitignore'
