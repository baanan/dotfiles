{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.firefox
  ];
}
