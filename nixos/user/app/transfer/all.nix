{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    nextcloud-client pkgsUnstable.bitwarden-desktop filezilla sshfs scrcpy p7zip
  ];

  services.flatpak.packages = [
    "org.jdownloader.JDownloader"
  ];
}
