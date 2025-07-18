{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    nextcloud-client pkgsUnstable.bitwarden filezilla
  ];
}
