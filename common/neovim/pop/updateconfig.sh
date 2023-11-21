# make sure you start in the correct directory
dir=$PWD
cd $(pwd | grep -o "^.*dotfiles")/common/neovim

rm -r ~/.config/nvim
cp -r config ~/.config/nvim/

# go back to original dir
cd $dir
