# make sure you start in the correct directory
$dir = Get-Location
cd (( pwd | rg -o "^.*dotfiles") + "\common\neovim")

# copy over config
cp -r -Force config/nvim/* ~/Appdata/Local/nvim/
cp -r -Force config/* ~/.config/

# go back to original dir
cd $dir
