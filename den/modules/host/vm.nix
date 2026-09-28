# enables `nix run .#vm`. it is very useful to have a VM
# you can edit your config and launch the VM to test stuff
# instead of having to reboot each time.
{ inputs, den, ... }:
{
  den.hosts.x86_64-linux.vm = {
    home-manager.enable = true;
  };

  den.hosts.x86_64-linux.vm = { };
  den.hosts.x86_64-linux.vm-desktop = { };

  den.aspects.vm-desktop = {
    includes = [
      den.aspects.vm
      den.aspects.desktop
    ];
  };

  den.aspects.vm = {
    nixos = { ... }: {
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
            host = inputs.self.nixosConfigurations.vm-desktop.config;
          in
          ''
            ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
          '';
      };
    };
}
