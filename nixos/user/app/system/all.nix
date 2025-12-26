{ pkgs, pkgsUnstable, profile, ... }:

{
  home.packages = with pkgs; [
    mission-center protonvpn-gui unzip
  ] ++ (if profile == "desktop" then [ openrgb ] else []);

  services.flatpak.packages = [
    "com.usebottles.bottles" "com.github.tchx84.Flatseal"
  ];
}
