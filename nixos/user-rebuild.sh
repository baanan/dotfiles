#!/bin/sh

if [ -z "$1" ]; then
  echo "usage: $0 <profile>"
  exit 1
fi

pushd ~/Documents/projects/dotfiles/nixos/
./../commit.sh
home-manager switch --flake .#$1
res=$?
if [[ $res -eq 0 ]]; then
  git push
else
  git reset HEAD~
fi
popd
exit $res
