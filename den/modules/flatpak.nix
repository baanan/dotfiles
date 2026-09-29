{ inputs, ... }:
{
  den.default.homeManager = { pkgs, ... }: {
    imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

    services.flatpak.enable = true;
    services.flatpak.update.onActivation = true;
    services.flatpak.uninstallUnmanaged = true;
  };

  den.default.nixos = {
    services.flatpak.enable = true;
  };

  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
}
