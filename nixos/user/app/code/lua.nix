{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    stylua lua-language-server
  ];
}
