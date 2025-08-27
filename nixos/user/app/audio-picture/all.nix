{ pkgs, pkgsUnstable, ... }:

{
  home.packages = with pkgs; [
    obsidian gimp gthumb ffmpeg
  ];

  programs.yt-dlp = {
    enable = true;
    package = pkgsUnstable.yt-dlp;
  };
}
