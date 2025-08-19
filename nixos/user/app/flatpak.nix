{ pkgs, nix-flatpak, ... }:

{
  imports = [ nix-flatpak.homeManagerModules.nix-flatpak ];
  services.flatpak.enable = true;
}
