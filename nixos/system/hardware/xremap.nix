{ nixpkgs, ... }:

{
  services.xremap = {
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
