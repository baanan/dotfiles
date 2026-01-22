{ pkgs, config, system, profile, ... }:

{
  home.packages = with pkgs; [ ];

  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" "catppuccin" "catppuccin-icons" ];
    userSettings = {
      disable_ai = true;
      vim_mode = false;
    };
  };
}
