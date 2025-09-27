{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    nextcloud-client pkgsUnstable.bitwarden filezilla sshfs scrcpy
  ];

  services.flatpak.packages = [
    "org.jdownloader.JDownloader"
  ];
}
