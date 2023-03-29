#!/bin/zsh

sed -i 's|#panel .dashboard-button StIcon{ padding-top: 0; padding-bottom: 0; }|#panel .dashboard-button StIcon{ padding-top: 0; padding-bottom: 0; padding-left: 0; padding-right: 0; margin-left: 4px; icon-size: 40px; }|g' /home/thate/.local/share/gnome-shell/extensions/widgets@aylur/stylesheet.css
