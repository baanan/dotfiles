#!/bin/zsh

dir=$PWD

# give permission to link music folders
flatpak override com.usebottles.bottles --user --filesystem="~/Music"
flatpak override com.usebottles.bottles --user --filesystem=xdg-data/applications

# link music folders
cd ~/.var/app/com.usebottles.bottles/data/bottles/bottles/MusicBee/drive_c/
ln -s ~/Music users/thate/
ln -s users/ Users/

# copy over config
cp $dir/AppData users/thate/
