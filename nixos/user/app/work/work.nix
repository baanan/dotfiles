{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nextcloud-client obsidian bitwarden filezilla gimp
  ];
}
