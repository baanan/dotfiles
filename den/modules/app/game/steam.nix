{ den, inputs, ... }:
{
  den.aspects.game = {
    includes = [ den.aspects.steam ];
  };

  den.aspects.steam.nixos = { pkgs, ... }: {
    programs.steam = {
      enable = true;
    };

    environment.systemPackages = [
      pkgs.steam-devices-udev-rules
    ];
  };
}
