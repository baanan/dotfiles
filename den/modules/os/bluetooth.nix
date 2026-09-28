{ den, ... }:
{
  den.aspects.minimal.includes = [ den.aspects.bluetooth ];

  den.aspects.bluetooth.nixos = {
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Disable = "Headset";
          Experimental = "true";
        };
        Policy = {
          AutoEnable = "true";
        };
      };
    };
  };
}
