#!/bin/zsh

# go to documents
dir=$PWD
cd ~/Documents/utilities/

# clone leetmouse (i know skyl3r's version exists, but they have seemed to abandon it)
git clone https://github.com/systemofapwne/leetmouse.git
cd leetmouse

# copy over config
cp $dir/config.h driver/

# install
sudo make setup_dkms && sudo make udev_install
sudo dkms install -m leetmouse-driver -v 0.9.0
