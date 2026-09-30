#!/bin/sh

if [ -z "$1" ]; then
    echo "usage: $0 <profile>"
    exit 1
fi

pushd ~/Documents/projects/dotfiles/den/
./../commit.sh
commited=$?

sudo nixos-rebuild switch --flake .#$1
success=$?

if [[ $commited ]]; then
    if [[ $success ]]; then
        git push
    else
        git reset HEAD~
    fi
fi

exit $success
