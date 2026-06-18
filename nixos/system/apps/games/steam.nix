{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
  };

  environment.systemPackages = [
    pkgs.steam-devices-udev-rules
  ];
}
