{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ kdePackages.kdeconnect-kde ];
  #
  # services.kdeconnect = {
  #   enable = true;
  # };
}
