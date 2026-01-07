{
  description = "Flake :)";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    bugstalker.url = "github:baanan/BugStalker";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, neovim-nightly-overlay, xremap-flake, nixpkgs-unstable, nixpkgs-master, nix-darwin, ... } : 
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
          inputs.fenix.overlays.default
        ];
      };
      pkgsAarch64 = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
        overlays = [
          inputs.fenix.overlays.default
        ];
      };
      pkgsUnstable = import nixpkgs-unstable {
        system = systemSettings.system;
        config.allowUnfree = true;
      };
      pkgsMaster = import nixpkgs-master {
        system = systemSettings.system;
        config.allowUnfree = true;
      };
      extraSpecialArgs = {
        inherit neovim-nightly-overlay;
        inherit pkgsUnstable;
        inherit pkgsMaster;
        system = systemSettings.system;
        bugstalker = inputs.bugstalker;
        nix-flatpak = inputs.nix-flatpak;
      };
      modules = [
        inputs.lanzaboote.nixosModules.lanzaboote
      ];
    in {

    nixosConfigurations = {
      laptop = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ 
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
          ./system/hardware/devices/laptop.nix
        ] ++ modules;
        specialArgs = {
          inherit xremap-flake;
          profile = "laptop";
        };
      };
      desktop = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ 
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
          ./system/hardware/devices/desktop.nix
        ] ++ modules;
        specialArgs = {
          inherit xremap-flake;
          profile = "desktop";
        };
      };
    };

    homeConfigurations = {
      laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = extraSpecialArgs // { profile = "laptop"; };
        modules = [
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
        ];
      };
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = extraSpecialArgs // { profile = "desktop"; };
        modules = [
          (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
        ];
      };
      macos = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsAarch64;
        extraSpecialArgs = extraSpecialArgs // { profile = "macos"; system = "aarch64-darwin"; };
        modules = [
          ./profiles/macos/home.nix
        ];
      };
    };

    darwinConfigurations = {
      laptop = nix-darwin.lib.darwinSystem {
        modules = [ ./profiles/macos/configuration.nix ];
        specialArgs = {
          inherit self;
        };
      };
    };
  };
}
