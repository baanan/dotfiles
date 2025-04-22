{
  description = "Flake :)";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, fenix, neovim-nightly-overlay, ... } : 
    let
      systemSettings = {
        profile = "work";
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
    in {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ 
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
          inputs.xremap-flake.nixosModules.default
          ./system/hardware/xremap.nix
        ];
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
          system = systemSettings.system;
        };
      };
    };
  };
}
