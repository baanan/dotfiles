#!/bin/zsh
# adapted from https://getmusicbee.com/forum/index.php?topic=30205.0

export WHO=`whoami`

# set wine options
mkdir -p ~/Documents/executables/musicbee/.wine

export WINEARCH=win32
export WINEPREFIX=~/Documents/executables/musicbee/.wine/

# # install wine
# ## get keys
# wget -nc https://dl.winehq.org/wine-builds/winehq.key
# sudo mv winehq.key /usr/share/keyrings/winehq-archive.key
# ## add repository
# wget -nc https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
# sudo mv winehq-jammy.sources /etc/apt/sources.list.d/
## update
sudo apt update
## install
sudo apt install wine -y
sudo apt install winetricks -y

# setup wine
echo
echo configure musicbee wineprefix
echo

winecfg

winetricks -q --force dotnet461 xmllite gdiplus 

## fonts
winetricks corefonts cjkfonts 

wine regedit segoe-cjk.reg # add Source Han Sans fallback to Segoe UI

# install megacmd 
wget -O mega.deb "https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd-xUbuntu_22.04_amd64.deb"
sudo apt install ./mega.deb
rm ./mega.deb
# sudo apt install megacmd

# get installer from site
mega-get `curl https://getmusicbee.com/downloads/ | rg -i --context 3 "get musicbee installer" | rg -o "https://mega.nz/file/[^\"]*"`

## get installer version by getting the first occurence of the filename
versions=`/bin/ls | rg -o "MusicBeeSetup[^.]*"`
version=${versions%$'\n'*}

## unpack and run installer
7z e "${version}.zip"
wine "${version}.exe"

## cleanup
rm ${version}.*


# link C:/users/ to C:/Users/
mkdir -p ${WINEPREFIX}drive_c/Users/$WHO
ln -s ~/Music/ ${WINEPREFIX}drive_c/Users/$WHO/Music

# add config
cp -r AppData/* ${WINEPREFIX}drive_c/users/$WHO/AppData/


# add alias
echo "# MusicBee Alias\nalias MusicBee='WINEPREFIX=${WINEPREFIX} wine ${WINEPREFIX}drive_c/Program\ Files/MusicBee/MusicBee.exe'" >> ~/.zshrc

# remove megacmd if wanted
echo
echo Remove Megacmd?
read b
echo

[[ $b =~ "^y" ]] && sudo apt remove megacmd
