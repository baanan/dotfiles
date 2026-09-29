{ den, ... }:
{
  den.aspects.personal = {
    includes = [ den.aspects.apps-system ];
  };

  den.aspects.apps-system.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      mission-center
      sbctl
      pika-backup
      cloudflared
    ];

    services.flatpak.packages = [
      "com.usebottles.bottles"
      "com.github.tchx84.Flatseal"
    ];
  };
}
