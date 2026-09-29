{ den, ... }:
{
  den.aspects.personal = {
    includes = [
      den.aspects.audio-picture
    ];
  };

  den.aspects.audio-picture = {
    includes = [
      (den.batteries.unfree [ "obsidian" ])
    ];

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        obsidian
        gimp
        gthumb
        ffmpeg
        anki
        spotdl
        presenterm
      ];

      services.flatpak.packages = [
        "com.github.johnfactotum.Foliate"
        "io.gitlab.news_flash.NewsFlash"
      ];

      programs.yt-dlp = {
        enable = true;
      };
    };
  };
}
