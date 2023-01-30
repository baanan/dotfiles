# install installer
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

# install extensions
gnome-shell-extension-installer 3193 # blur my shell
gnome-shell-extension-installer 1160 # dash to panel
gnome-shell-extension-installer 1319 # gsconnect
gnome-shell-extension-installer 750  # openweather

# copy config
cp -r prefs/* ~/.local/share/gnome-shell/extensions
# dconf dump /org/gnome/terminal/ > terminal.preferences
cat terminal.preferences | dconf load /org/gnome/terminal/
