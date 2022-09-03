# make sure you start in the correct directory
cd `pwd | grep -o "^.*dotfiles"`/common/neovim

cp -r config/* ~/.config/
