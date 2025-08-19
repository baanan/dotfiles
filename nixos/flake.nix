{
  description = "Flake :)";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    bugstalker.url = "github:baanan/BugStalker";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, fenix, neovim-nightly-overlay, xremap-flake, nixpkgs-unstable, ... } : 
    let
      systemSettings = {
        profile = "personal";
        system = "x86_64-linux";
      };

      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        system = systemSettings.system;
        config.allowUnfree = true;
        overlays = [
          fenix.overlays.default
        ];
      };
      pkgsUnstable = import nixpkgs-unstable {
        system = systemSettings.system;
        config.allowUnfree = true;
      };
    in {

    nixosConfigurations = {
      laptop = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ 
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
          ./system/hardware/devices/laptop.nix
        ];
        specialArgs = {
          inherit xremap-flake;
        };
      };
      desktop = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ 
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
          ./system/hardware/devices/desktop.nix
        ];
        specialArgs = {
          inherit xremap-flake;
        };
      };
    };

    homeConfigurations = {
      thate = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
        ];
        extraSpecialArgs = {
          inherit neovim-nightly-overlay;
          inherit pkgsUnstable;
          system = systemSettings.system;
          bugstalker = inputs.bugstalker;
          nix-flatpak = inputs.nix-flatpak;
        };
      };
    };
  };
}
