# make sure you start in the correct directory
cd (( pwd | rg -o "^.*dotfiles") + "\common\neovim")

# copy over config
cp -r -Force config/nvim/* ~/Appdata/Local/nvim/
cp -r -Force config/* ~/.config/
