{ inputs, ... }:
{
  den.default.homeManager = {
    imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];
    services.flatpak.enable = true;
  };

  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
}
