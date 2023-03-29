#!/bin/zsh

dconf dump /org/gnome/shell/extensions/ > extensions.dconf
# remove any sensitive data
rg --passthru --multiline "\[gsconnect.*\]\n(.+=.+\n)+\n" --replace "" extensions.dconf > tmp.dconf && mv tmp.dconf extensions.dconf
rg --passthru --multiline "\ncity=.*" --replace "" extensions.dconf > tmp.dconf && mv tmp.dconf extensions.dconf
