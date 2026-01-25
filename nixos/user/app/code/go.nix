{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
  ];
}
