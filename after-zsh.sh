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

# install other utilites
brew install jandedobbeleer/oh-my-posh/oh-my-posh
sudo apt install exa
sudo apt install ripgrep
sudo apt install fzf
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# install languages
curl https://sh.rustup.rs -sSf | sh -s -- -y

# add zsh plugins
plugins="zsh-z zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search"
sed -i -r "s/plugins\s*=\s*(\(\s*)((\w+ )*)(\w*\))/plugins=\1\2$plugins \4/g" ~/.zshrc

# copy over .config
## replace with below once ripgrep issue 2020 is fixed
## rg --multiline --multiline-dotall --passthru "\[start\].*\[end\]" -r "[start]${cat .zshrc}[end]" ~/.zshrc > ~/.zshrc
cd $dir

cp -r config/ ~/ 

cat .zprofile >> ~/.zprofile
cat .zshrc >> ~/.zshrc
cat .profile >> ~/.profile
