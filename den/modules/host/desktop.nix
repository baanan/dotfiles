{ den, ... }:
{
  den.hosts.x86_64-linux.desktop = {
    includes = [ den.aspects.desktop.hardware ];
  };

  # host aspect
  den.aspects.desktop = {
    includes = [
      den.aspects.gaming
      (den.batteries.unfree [
        "nvidia-x11"
        "nvidia-settings"
      ])
    ];
  };

  den.aspects.desktop.hardware.nixos =
    {
      modulesPath,
      pkgs,
      lib,
      config,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      boot.kernelPackages = pkgs.linuxPackages;

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/cdad1a6c-19f9-4680-880c-6827304d84a6";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/05BC-6596";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/37b65397-86b2-47a0-bd6c-3e329d67fc57"; }
      ];

      # mount points

      fileSystems."/mnt/popos" = {
        device = "/dev/disk/by-uuid/d39cbf96-6894-4fba-bc09-b325bb53c0b9";
        fsType = "ext4";
        options = [ "nofail" ];
      };

      fileSystems."/mnt/tera" = {
        device = "/dev/disk/by-uuid/8832ECEB32ECDF66";
        fsType = "ntfs";
        options = [ "nofail" ];
      };

      fileSystems."/mnt/windows" = {
        device = "/dev/disk/by-uuid/1CC2204AC2202B0A";
        fsType = "ntfs";
        options = [ "nofail" ];
      };

      # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
      # (the default) this is the recommended approach. When using systemd-networkd it's
      # still possible to use this option, but it's recommended to use it in conjunction
      # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
      networking.useDHCP = lib.mkDefault true;
      # networking.interfaces.enp8s0.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      hardware.graphics.enable = true;
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia.open = true;

      hardware.nvidia.prime.offload.enable = true;
      hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
      hardware.nvidia.prime.nvidiaBusId = "PCI:1:0:0";

      # powerManagement.enable = true;
      hardware.nvidia.powerManagement.enable = true;
      hardware.nvidia.powerManagement.finegrained = true;
    };
}
