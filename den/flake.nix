# DO-NOT-EDIT. This file was auto-generated using github:denful/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/main";
    den.url = "github:denful/den";
    fenix.url = "github:nix-community/fenix";
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:denful/import-tree";
    lanzaboote.url = "github:nix-community/lanzaboote/v1.1.0";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    sops-nix.url = "github:Mic92/sops-nix";
    xremap-flake.url = "github:xremap/nix-flake";
  };
}
