# make sure you start in the correct directory
cd `pwd | grep -o "^.*dotfiles"`/common/discord

# copy over config
cp -r config/* ~/Library/"Application Support"/
