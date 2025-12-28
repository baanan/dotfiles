{ pkgs, pkgsUnstable, profile, ... }:

{
  home.packages = with pkgs; [
    mission-center protonvpn-gui unzip pkgsUnstable.sbctl
  ];

  services.flatpak.packages = [
    "com.usebottles.bottles" "com.github.tchx84.Flatseal"
  ];
}
