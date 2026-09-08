# enables `nix run .#vm`. it is very useful to have a VM
# you can edit your config and launch the VM to test stuff
# instead of having to reboot each time.
{ inputs, den, ... }:
{
  den.hosts.x86_64-linux.vm = {
    users.thate = { };
  };

  den.aspects.vm = {
    includes = [
      den.aspects.desktop
      (den.batteries.tty-autologin "thate")
    ];
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
