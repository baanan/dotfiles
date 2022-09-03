#!/bin/zsh

# install
echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
curl -L https://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add
sudo apt-get update
sudo apt-get install resilio-sync

# setup
sudo systemctl enable resilio-sync
sudo usermod -aG $(whoami) rslsync
sudo usermod -aG rslsync $(whoami)
# sudo chmod g+rw synced_folder


