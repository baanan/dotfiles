{ pkgs, profile, ... }:

{
  services.hardware.openrgb = {
    enable = profile == "desktop";
    package = pkgs.openrgb-with-all-plugins;
  };
}
