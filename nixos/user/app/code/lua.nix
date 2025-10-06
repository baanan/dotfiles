{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    stylua pkgsUnstable.emmylua-ls
  ];
}
