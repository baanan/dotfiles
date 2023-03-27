#!/bin/zsh

# go to documents
dir=$PWD
cd ~/Documents/utilities/leetmouse/

# copy over config
cp $dir/config.h driver/

# uninstall
## Unbind all mice from the driver
sudo /usr/lib/udev/leetmouse_manage unbind_all
## Uninstall the driver
sudo dkms remove -m leetmouse-driver -v 0.9.0
sudo make remove_dkms && sudo make udev_uninstall

# reinstall
sudo make setup_dkms && sudo make udev_install
sudo dkms install -m leetmouse-driver -v 0.9.0
