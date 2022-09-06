# make sure you start in the correct directory
dir=$PWD
cd `pwd | grep -o "^.*dotfiles"`/common/discord

# download discord
sudo nala install discord

# download betterdiscordctl
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin

# download betterdiscord
betterdiscordctl install

# copy over config
cp -r config/* ~/.config/

# go back to original dir
cd $dir
