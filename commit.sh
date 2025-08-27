#!/bin/sh

pushd ~/Documents/projects/dotfiles/
git add .
git commit -m "$(date)"
popd
