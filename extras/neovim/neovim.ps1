# NOTE: make sure the OpenSSHAgent Service is automatically started for git
# TODO: neovide installer

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
scoop install lazygit

# install python
scoop install python
start ("~\scoop\apps\python\current\" + (ls -n ~\scoop\apps\python\current | rg "^install-pep"))
python -m pip install --user --upgrade pynvim

# copy over config
cp -r -Force config/nvim/* ~/Appdata/Local/nvim/
cp -r -Force config/* ~/.config/

# install plugins
nvim --headless +PlugInstall +qa

# install coc plugins
echo ""
$installcoc = Read-Host "Install Coc Plugins?"
if ($installcoc -like "y*") {
    nvim "+CocInstall coc-rust-analyzer coc-sumneko-lua coc-vimlsp coc-java coc-sh coc-json coc-snippets"
}
