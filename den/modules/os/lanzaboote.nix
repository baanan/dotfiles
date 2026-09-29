{ den, inputs, ... }:
{
  den.aspects.personal.includes = [ den.aspects.lanzaboote ];

  flake-file.inputs = {
    lanzaboote.url = "github:nix-community/lanzaboote/v1.1.0";
  };

  den.aspects.lanzaboote.nixos = { lib, ... }: {
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
    ];

    boot.loader.timeout = 0;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.loader.systemd-boot.enable = lib.mkForce false;

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
