{ config, pkgs, ... }:

{
  imports =
    [
      ./../work/home.nix
      ./../../user/app/games/all.nix
    ];

  home.packages = with pkgs; [
    discord
  ];
}
