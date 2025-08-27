#!/bin/sh

if [ -z "$1" ]; then
  echo "usage: $0 <profile>"
  exit 1
fi

pushd ~/Documents/projects/dotfiles/nixos/
./../commit.sh
home-manager switch --flake .#$1
if [[ $? -eq 0 ]]; then
  git push
  popd
  exit 0
else
  git reset HEAD~
  popd
  exit 1
fi
