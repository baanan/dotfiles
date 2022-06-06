# NOTE: make sure the OpenSSHAgent Service is automatically started for git

#Requires -RunAsAdministrator

# install neovim
scoop install neovim

# install vim plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# install other dependencies
scoop install ripgrep
scoop install nodejs
choco install universal-ctags -y
choco install llvm
scoop install gcc

# copy over config
cp -r -Force config/* ~/.config/

# install plugins
nvim --headless +PlugInstall +qa
