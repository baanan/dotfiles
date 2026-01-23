{ pkgs, config, system, profile, ... }:

{
  home.packages = with pkgs; [ ];

  home.file.".config/zed".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/projects/dotfiles/common/zed/config";
  programs.zed-editor = {
    enable = true;
  };
}
