{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    obsidian gimp gthumb ffmpeg anki pkgsUnstable.spotdl
  ];

  programs.yt-dlp = {
    enable = true;
    package = pkgsUnstable.yt-dlp;
  };
}
