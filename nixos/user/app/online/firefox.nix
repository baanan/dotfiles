{ config, pkgs, ... }:

{
  home.packages = [];

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
      };
      school = {
        id = 1;
        name = "school";
        isDefault = false;
      };
      guest = {
        id = 2;
        name = "guest";
        isDefault = false;
      };
    };
  };
}
