{ config, pkgs, ... }:

{
  imports =
    [
      ./minecraft.nix
    ];

  services.flatpak.packages = [
    "org.vinegarhq.Sober" "io.mrarm.mcpelauncher"
  ];

  home.packages = with pkgs; [
    gamescope r2modman
  ];
}
