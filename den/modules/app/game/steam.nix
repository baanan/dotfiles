{ den, inputs, ... }:
{
  den.aspects.game = {
    includes = [ den.aspects.steam ];
  };

  den.aspects.steam.includes = [
    (den.batteries.unfree [
      "steam-unwrapped"
      "steam"
    ])
  ];

  den.aspects.steam.nixos = { pkgs, ... }: {
    programs.steam = {
      enable = true;
    };

    environment.systemPackages = [
      pkgs.steam-devices-udev-rules
    ];
  };
}
