#!/bin/zsh

# dependencies: sparse nerd font repository in ~/Documents/utilities/nerd-fonts
#               fd
#               latest zip file in folder

dir=$PWD

# remove old stuff and make room for new stuff
rm iosevka-nerd-font/*
mkdir iosevka

# get patcher
cd ~/Documents/utilities/nerd-fonts
git sparse-checkout add src

# unzip font
cd $dir
fd -e .zip --exec unzip -d iosevka

# patch
cd iosevka
fd --exec fontforge -script /home/thate/Documents/utilities/nerd-fonts/font-patcher --mono --complete

# move files
mv iosevka/*Nerd* iosevka-nerd-font/ 
rm iosevka
