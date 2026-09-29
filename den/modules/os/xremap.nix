{ den, inputs, ... }:
{
  den.aspects.personal.includes = [ den.aspects.xremap ];

  flake-file.inputs = {
    xremap-flake.url = "github:xremap/nix-flake";
  };

  den.aspects.xremap.nixos = {
    imports = [
      inputs.xremap-flake.nixosModules.default
    ];

    services.xremap = {
      enable = true;
      serviceMode = "user";
      userName = "thate";
      withGnome = true;
      config = {
        modmap = [
          {
            name = "Global";
            remap = {
              "CapsLock" = "Esc";
            };
          }
        ];
      };
    };
  };
}
