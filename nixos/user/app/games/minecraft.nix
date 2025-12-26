{ pkgs, config, pkgsUnstable, ... }:

{
  home.packages = [
    pkgsUnstable.prismlauncher
  ];
}
