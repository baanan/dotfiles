{ config, pkgs, ... }:

{
  imports =
    [
      ./minecraft.nix
    ];

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];
}
