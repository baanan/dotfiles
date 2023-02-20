# install installer
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

# install extensions
gnome-shell-extension-installer 3193 # blur my shell
gnome-shell-extension-installer 1160 # dash to panel
gnome-shell-extension-installer 1319 # gsconnect
gnome-shell-extension-installer 750  # openweather
gnome-shell-extension-installer 5237 # rounded window corners
gnome-shell-extension-installer 19 # user themes

## copy over config
### schemas
fd -g '*/schemas/org.gnome.shell.extensions.*.gschema.xml' -x cp {} /usr/share/glib-2.0/schemas

# install themes
## adw-gtk3
### get
wget https://github.com/lassekongo83/adw-gtk3/releases/latest/download/adw-gtk3v4-3.tar.xz
tar -xf adw-gtk3v4-3.tar.xz --directory /usr/share/themes/
### install
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
### flatpak
flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

## shell theme
### clone
git clone --filter=blob:none --sparse https://github.com/lime-desu/MochaTheme.git
cd MochaTheme
git sparse-checkout add MochaTheme-2
### remove panel outline (because of dash to panel)
rg --passthru --multiline "#panel \{[^}]*\}" --replace "" MochaTheme-2/gnome-shell/gnome-shell.css > tmp.css && mv tmp.css MochaTheme-2/gnome-shell/gnome-shell.css
### install
mv MochaTheme-2 ~/.themes/
### cleanup
cd .. && rm -r MochaTheme

# other applications
flatpak install com.github.GradienceTeam.Gradience

# copy config
./set-config.sh
dconf load /org/gnome/terminal/ < terminal.preferences 
