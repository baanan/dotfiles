{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vtsls vscode-langservers-extracted
  ];
}
