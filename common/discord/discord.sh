# make sure you start in the correct directory
cp scroll.sh ~/Documents/scripts/

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
cp -r BetterDiscord ~/.var/app/com.discordapp.Discord/config/
cd ~/.var/app/com.discordapp.Discord/config/BetterDiscord/themes/

wget https://github.com/catppuccin/discord/blob/main/themes/latte.theme.css 
wget https://github.com/catppuccin/discord/blob/main/themes/frappe.theme.css 
wget https://github.com/catppuccin/discord/blob/main/themes/macchiato.theme.css 
wget https://github.com/catppuccin/discord/blob/main/themes/mocha.theme.css 

# go back to original dir
cd $dir
