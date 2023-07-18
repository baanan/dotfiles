#!/bin/zsh

# go to documents
dir=$PWD
cd ~/Documents/utilities/fixedmouse/

# copy over config
cp $dir/fixedmouse-config.h driver/config.h

# uninstall
sudo apt remove leetmouse

# reinstall
./scripts/build_deb.sh
sudo dpkg -i pkg/build/leetmouse*.deb
