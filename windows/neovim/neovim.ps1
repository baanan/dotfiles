# NOTE: make sure the OpenSSHAgent Service is automatically started for git
# TODO: neovide installer

#Requires -RunAsAdministrator

# make sure you start in the correct directory
$dir = Get-Location
cd (( pwd | rg -o "^.*dotfiles") + "\common\neovim")

# install neovim
scoop install neovim
scoop install neovide

# install packer
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

# install other dependencies
scoop install ripgrep
scoop install nodejs
choco install universal-ctags -y
choco install llvm -y
scoop install gcc
scoop install lazygit
scoop install cmake

# install bacon
cargo install --locked bacon
# remember to run the following command in a rust project to finish installing 
# rg --passthru "# (export_locations = true)" -r '$1' $(bacon --prefs) > tmp.toml && mv -Force tmp.toml $(bacon --prefs)

# install python
scoop install python
start ("~\scoop\apps\python\current\" + (ls -n ~\scoop\apps\python\current | rg "^install-pep"))
python -m pip install --user --upgrade pynvim

# copy over config
cp -r -Force config/nvim/* ~/Appdata/Local/nvim/
cp -r -Force config/* ~/.config/

# install plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install coc plugins
echo ""
$installcoc = Read-Host "Install Coc Plugins?"
if ($installcoc -like "y*") {
    nvim "+CocInstall coc-rust-analyzer coc-sumneko-lua coc-vimlsp coc-java coc-sh coc-json coc-snippets"
}

# set up global gitignore
git config --global core.excludesFile "$Env:USERPROFILE\.gitignore"
cat home/.gitignore >> ~/.gitignore

# go back to original dir
cd $dir
