{ config, pkgs, profile, ... }:

{
  home.packages = [];

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = profile != "laptop";
      };
      school = {
        id = 1;
        name = "school";
        isDefault = profile == "laptop";
      };
      guest = {
        id = 2;
        name = "guest";
        isDefault = false;
      };
    };
  };
}
