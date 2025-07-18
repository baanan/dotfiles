{ config, pkgs, ... }:

{
  imports =
    [
      ./../work/configuration.nix
      ./../../system/apps/games/steam.nix
    ];
}
