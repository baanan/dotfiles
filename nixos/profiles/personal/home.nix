{ config, pkgs, ... }:

{
  imports =
    [
      ./../work/home.nix
      ./../../user/app/games/all.nix
      ./../../user/app/online/discord.nix
    ];
}
