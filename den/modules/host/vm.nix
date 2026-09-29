# enables `nix run .#vm`. it is very useful to have a VM
# you can edit your config and launch the VM to test stuff
# instead of having to reboot each time.
{ inputs, den, ... }:
{
  den.hosts.x86_64-linux.vm = { };
  den.hosts.x86_64-linux.vm-desktop-host = { };
  den.hosts.x86_64-linux.vm-laptop-host = { };

  den.aspects.vm-desktop-host = {
    includes = [
      den.aspects.vm
      den.aspects.desktop
    ];
  };

  den.aspects.vm-laptop-host = {
    includes = [
      den.aspects.vm
      den.aspects.laptop
    ];
  };

  den.aspects.vm = {
    nixos = { ... }: {
      virtualisation.vmVariant = {
        virtualisation.cores = 12;
        virtualisation.memorySize = 16384;
        virtualisation.diskSize = 8192;
      };
    };

    homeManager = { pkgs, ... }: {
      systemd.user.services.clone-dotfiles = {
        Service = {
          Type = "oneshot";
          ExecStart = pkgs.writeShellScript "my-script" ''
            mkdir -p ~/Documents/projects/
            test -d ~/Documents/projects/dotfiles/ || git clone https://github.com/baanan/dotfiles.git ~/Documents/projects/dotfiles/
          '';
        };

        Install = {
          WantedBy = [ "default.target" ];
        };
      };
    };
  };

  perSystem =
    { pkgs, ... }:
    {
      packages.vm-desktop = pkgs.writeShellApplication {
        name = "vm-desktop";
        text =
          let
            host = inputs.self.nixosConfigurations.vm-desktop-host.config;
          in
          ''
            ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
          '';
      };

      packages.vm-laptop = pkgs.writeShellApplication {
        name = "vm-laptop";
        text =
          let
            host = inputs.self.nixosConfigurations.vm-laptop-host.config;
          in
          ''
            ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
          '';
      };
    };
}
