# download discord
sudo apt install discord

# download betterdiscordctl
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin

# download betterdiscord
betterdiscordctl install

# copy over config
cp -r config/* ~/.config/
