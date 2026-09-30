#!/bin/sh

pushd ~/Documents/projects/dotfiles/
git add .
git commit -m "$(date)"
retval=$?
popd

exit $retval
