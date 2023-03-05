#!/usr/bin/zsh

cd ~/.local/share/flatpak/app/com.discordapp.Discord/current/active/export/share/applications
rg --passthru "Exec=.*[^l]$" --replace '$0 --enable-blink-features=MiddleClickAutoscroll' com.discordapp.Discord.desktop > tmp.css && mv tmp.css com.discordapp.Discord.desktop
