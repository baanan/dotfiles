{ den, ... }: {
  den.hosts.x86_64-linux.desktop = {
    users.thate = { };

    includes = [
      den.aspects.desktop.hardware
    ];
  };

  den.aspects.desktop = {
    includes = [
      den.aspects.minimal
    ];
  };

  den.aspects.desktop.hardware.nixos = {

  };
}
