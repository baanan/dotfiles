{ pkgs, pkgsUnstable, pkgsMaster, ... }:

{
  home.packages = with pkgs; [
    obsidian gimp gthumb ffmpeg anki pkgsMaster.spotdl presenterm
  ];

  services.flatpak.packages = [
    "com.github.johnfactotum.Foliate"
  ];

  programs.yt-dlp = {
    enable = true;
    package = pkgsMaster.yt-dlp;
  };
}
