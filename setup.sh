#!/bin/bash

sudo apt update

# install zsh and oh-my-zsh
sudo apt install zsh -y
chsh -s /usr/bin/zsh

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

./after-zsh.sh
