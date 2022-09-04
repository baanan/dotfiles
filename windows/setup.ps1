$dir = $PWD

# install package managers
#   scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser 
if (![bool](Get-Command -Name 'scoop' -ErrorAction SilentlyContinue)) {
    irm get.scoop.sh | iex
}

scoop bucket add extras
scoop install sudo

#   chocolatey ( i have no idea how else to do this )
# if (sudo ![bool](Get-Command -Name 'choco' -ErrorAction SilentlyContinue)) {
#     echo "Please run this in an admin prompt to install choco:"
#     echo "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
#     exit
# }

# install languages
scoop install python && "~\scoop\apps\python\current\install-pep-514.reg"
curl https://win.rustup.rs/x86_64 --output rustup-init.exe; ./rustup-init.exe; rm rustup-init.exe
# update path (for rust)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")


# establish documents folder structure
mkdir ~/Documents_
mkdir ~/Documents_/utilities
mkdir ~/Documents_/projects
mkdir ~/Documents_/executables


# install utilites
scoop install fd
scoop install less
scoop install bat
scoop install ripgrep
scoop install fzf


# install fonts
#     iosevka (may have stolen from the nerd font installer)
cd ../common/iosevka/iosevka-nerd-font
$shellApp = New-Object -ComObject shell.application
$fonts = $shellApp.NameSpace(0x14)
Get-ChildItem -Filter *.ttf | 
Foreach-Object {
    $fonts.CopyHere($_.FullName)
}
#     nerd fonts
cd ~/Documents_/utilities/
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts && cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono && ./install.ps1 JetBrainsMono
git sparse-checkout add patched-fonts/Hack && ./install.ps1 Hack
cd $dir


# install powershell utilites
winget install JanDeDobbeleer.OhMyPosh -s winget
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PsFzf
Install-Module z
pip install thefuck
$env:PSModulePath += ';C:\Users\thate\Documents\PowerShell\Modules'


# install powertoys 
winget install powertoys -s winget
# Note: remap caps to home

# copy profile
mkdir ~/Documents/PowerShell
cat Microsoft.PowerShell_profile.ps1 > $PROFILE

# copy powershell config
./updateconfig.ps1

# copy terminal config
cp terminal\* C:\Users\thate\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\
