# enables `nix run .#vm`. it is very useful to have a VM
# you can edit your config and launch the VM to test stuff
# instead of having to reboot each time.
{ inputs, den, ... }:
{
  # use home manager module
  den.aspects.thate = {
    provides.vm = {
      includes = [
        den.aspects.vm
      ];
    };
  };

  den.hosts.x86_64-linux.vm = {
    users.thate = {
      includes = [ den.aspects.minimal ];
    };

    home-manager.enable = true;
  };

  den.aspects.vm = {
    includes = [
      den.aspects.work
      den.aspects.gaming
    ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.wget
      ];

      virtualisation.vmVariant = {
        virtualisation.cores = 12;
        virtualisation.memorySize = 16384;
      };

      home-manager.useUserPackages = true;
    };
  };

  perSystem =
    { pkgs, ... }:
    {
      packages.vm-desktop = pkgs.writeShellApplication {
        name = "vm";
        text =
          let
            host = inputs.self.nixosConfigurations.vm.config;
          in
          ''
            ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
          '';
      };
    };
}
