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
cp -r BetterDiscord ~/.config/BetterDiscord/
cd ~/.config/BetterDiscord/themes/

wget https://raw.githubusercontent.com/catppuccin/discord/main/themes/latte.theme.css
wget https://raw.githubusercontent.com/catppuccin/discord/main/themes/frappe.theme.css
wget https://raw.githubusercontent.com/catppuccin/discord/main/themes/macchiato.theme.css
wget https://raw.githubusercontent.com/catppuccin/discord/main/themes/mocha.theme.css

# go back to original dir
cd $dir
