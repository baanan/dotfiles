{ den, inputs, ... }: 
{
  # host configuration
  den.hosts.x86_64-linux.wsl = {
    includes = [ den.aspects.wsl.hardware ];
  };

  # host aspect
  den.aspects.wsl = {
    includes = [
      den.aspects.minimal
      den.aspects.nvim
      den.aspects.zed
      den.aspects.firefox
    ];

    excludes = [
      den.aspects.flatpak
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

    # environment.systemPackages = [ pkgs.wslutils ];

    # thanks ai
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        # Add other backends if needed, e.g., xdg-desktop-portal-wlr
      ];
      config.common = {
        default = [ "gtk" ];
      };
    };
  };
}

