{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    mission-center protonvpn-gui
  ];

  services.flatpak.packages = [
    "com.usebottles.bottles" "com.github.tchx84.Flatseal"
  ];
}
