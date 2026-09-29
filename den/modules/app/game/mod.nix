{ den, ... }:
{
  den.aspects.gaming = {
    includes = [ den.aspects.game ];
  };

  den.aspects.game.homeManager = { pkgs, ... }: {
    services.flatpak.packages = [
      "org.vinegarhq.Sober"
    ];

    home.packages = with pkgs; [
      cemu
      prismlauncher
    ];
  };

  den.aspects.game.nixos = {
    # for cemu
    services.udev.enable = true;
  };
}
