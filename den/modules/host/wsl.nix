{ den, inputs, ... }: 
{
  # host configuration
  den.hosts.x86_64-linux.wsl = {
    includes = [ den.aspects.wsl.hardware ];
  };

  # host aspect
  den.aspects.laptop = {
    includes = [
      den.aspects.minimal
    ];
  };

  flake-file.inputs = {
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  den.aspects.wsl.hardware.nixos = { pkgs, ...}: {
  imports = [
    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.default
  ];

  systemd.services."wsl-mnt-guard" = {
    overrideStrategy = "asDropin";
    unitConfig.ConditionPathIsMountPoint = "/mnt/wsl";
    serviceConfig = {
      ExecStart = [ "" "${pkgs.coreutils}/bin/true" ];
      ExecStop = [ "" "-${pkgs.util-linux}/bin/mount --make-rslave /mnt/wsl" ];
    };
  };

  wsl.enable = true;
  wsl.defaultUser = "thate";
  };
}

