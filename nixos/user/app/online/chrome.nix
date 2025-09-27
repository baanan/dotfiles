{ config, pkgs, pkgsUnstable, ... }:

{
  home.packages = [ pkgsUnstable.google-chrome ];
}
