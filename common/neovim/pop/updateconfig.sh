# make sure you start in the correct directory
dir=$PWD
cd `pwd | grep -o "^.*dotfiles"`/common/neovim

cp -r config/* ~/.config/

# go back to original dir
cd $dir
