{ pkgs, profile, ... }:

{
  services.hardware.openrgb = {
    enable = profile == "desktop";
  };
}
