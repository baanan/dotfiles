{ nixpkgs, ... }:

{
  services.xremap = {
    enable = true;
    serviceMode = "user";
    userName = "thate";
    withGnome = true;
    config = {
      modmap = [
        {
          name = "Global";
          remap = { "CapsLock" = "Esc"; };
        }
      ];
    };
  };
}
