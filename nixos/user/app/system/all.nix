{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    mission-center
  ];
}
