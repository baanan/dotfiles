{ config, pkgsUnstable, ... }:

{
  home.packages = [
    pkgsUnstable.vesktop
  ];
}
