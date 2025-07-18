{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian gimp gthumb
  ];
}
