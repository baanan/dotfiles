{ den, inputs, ... }:
{
  den.aspects.game = {
    includes = [ den.aspects.aagl ];
  };

  flake-file.inputs = {
    aagl.url = "github:ezKEa/aagl-gtk-on-nix/main";
  };

  den.aspects.aagl.nixos = { ... }: {
    imports = [ inputs.aagl.nixosModules.default ];
    nix.settings = inputs.aagl.nixConfig;
    programs.anime-game-launcher.enable = true;
  };
}
