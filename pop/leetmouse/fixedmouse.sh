#!/bin/zsh

# go to documents
dir=$PWD
cd ~/Documents/utilities/

# clone leetmouse (i know skyl3r's version exists, but they have seemed to abandon it)
git clone git@github.com:Cloudperry/leetmouse.git fixedmouse
cd fixedmouse

# copy over config
cp $dir/fixedmouse-config.h driver/config.h

# install
./scripts/build_deb.sh
sudo dpkg -i pkg/build/leetmouse*.deb
