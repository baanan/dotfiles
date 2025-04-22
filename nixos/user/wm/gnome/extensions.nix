{ pkgs, ... }:

{
  home.packages = [ pkgs.gnomeExtensions.blur-my-shell pkgs.gnomeExtensions.dash-to-panel ];
}
