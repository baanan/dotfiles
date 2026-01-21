{ config, pkgs, ... }:

{
  imports =
    [
      ./../work/configuration.nix
      ./../../system/apps/games/steam.nix
      ./../../system/apps/games/genshin.nix
      ./../../system/apps/waydroid.nix
    ];
}
