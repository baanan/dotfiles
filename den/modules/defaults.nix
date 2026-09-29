{ lib, ... }:
{
  den.default.nixos.system.stateVersion = "26.05";
  den.default.homeManager.home.stateVersion = "26.05";

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.default.nixos = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
