# adapted from https://getmusicbee.com/forum/index.php?topic=30205.0

# set wine options
mkdir -p ~/Documents/executables/musicbee/.wine

WINEARCH=win32
WINEPREFIX=~/Documents/executables/musicbee/.wine/

# install wine
sudo apt install wine winetricks

# setup wine
winecfg
winetricks -q dotnet48 xmllite gdiplus

# install megacmd (locked to ubuntu)
echo 
echo Ubuntu Version? Input [ENTER] to skip installing megacmd.
echo "	ex: 22.04"
read a

if [ -z $a ]; then
	echo "skipping megacmd install"
else
	wget -O mega.deb "https://mega.nz/linux/repo/xUbuntu_${a}/amd64/megacmd-xUbuntu_${a}_amd64.deb"
	sudo apt install ./mega.deb
	rm ./mega.deb
fi


# get installer from site
mega-get `curl https://getmusicbee.com/downloads/ | rg -i --context 3 "get musicbee installer" | rg -o "https://mega.nz/file/[^\"]*"`

## get installer version by getting the first occurence of the filename
versions=`/bin/ls | rg -o "/MusicBeeSetup[^.]*"`
version=${versions%$'\n'*}

## unpack and run installer
7z e "${version}.zip"
wine "${version}.exe"

## cleanup
rm ${version}.*


# add alias
echo "alias MusicBee='WINEPREFIX=${WINEPREFIX} wine ${WINEPREFIX}drive_c/Program\ Files/MusicBee/MusicBee.exe'" >> ~/.zshrc

# remove megacmd if wanted
echo
echo Remove Megacmd?
read a

if [[ $a =~ "^y" ]]; then
	sudo apt remove megacmd
fi
