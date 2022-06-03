# install neovim
scoop install neovim

# install vim plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# install other dependencies
scoop install ripgrep
scoop install nodejs
sudo choco install universal-ctags -y
sudo choco install llvm

# copy over config
cp -r config/* ~/.config/

# install plugins
nvim --headless +PlugInstall +qa
