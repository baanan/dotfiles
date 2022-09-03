# Prompt
Import-Module posh-git
# Import-Module oh-my-posh

## Use posh config
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

## Import terminal icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
# Set-Alias ll ls
Set-Alias grep rg
Set-Alias nano code
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
## Directory Alias
$Documents = "C:\Users\thate\Documents2"

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function prev () {
  (history)[-1] | iex
}

function view ($rest) {mpv --config-dir=C:\Users\thate\.config\mpv $rest}

function ls_sorted {
  return ls -File | sort LastWriteTimeUtc -Descending
}

function ls_before ($file) {
  $local:file_time = (ls -n | rg $file | Get-ChildItem).LastWriteTimeUtc
  return ls_sorted | where {$_.LastWriteTimeUtc -le $local:file_time}
}

# z -ListFiles | rg \s1\s*$ | rg '^(.+)(?:\d/\d{2}/\d{4})' -or '$1' | ForEach-Object { cd $_.Trim() && z -Remove }

$env:PYTHONIOENCODING="utf-8"
iex "$(thefuck --alias fuck)"

$env:XDG_CONFIG_HOME="$HOME\.config\"
