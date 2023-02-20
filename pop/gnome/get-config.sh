#!/bin/zsh

dconf dump /org/gnome/shell/extensions/ > extensions.dconf
# remove any sensitive data
rg --passthru --multiline "\[gsconnect\][^\[]*" --replace "" extensions.dconf > tmp.dconf && mv tmp.dconf extensions.dconf
