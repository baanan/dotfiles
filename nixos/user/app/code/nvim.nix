{ pkgs, config, neovim-nightly-overlay, system, pkgsUnstable, profile, ... }:

{
  home.packages = with pkgs; [
    pkgsUnstable.python315 clang fzf
    neovim-nightly-overlay.packages.${system}.default
  ] ++ (if profile != "macos" then [
    wl-clipboard nodePackages.npm 
  ] else []);

  # home.file.".config/nvim".source = ./../../../../common/neovim/config;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/projects/dotfiles/common/neovim/config";
  # home.file.".config/nvim".recursive = true;
  programs.neovim = {
    defaultEditor = true;
    withPython3 = true;
  };

  programs.neovide = {
    enable = true;
    settings = {
      font = {
        normal = "JetBrainsMono Nerd Font";
        size = 4;
      };
      maximized = true;
      fork = true;
    };
  };

  programs.git.enable = true;
  programs.git.ignores = [
    "neovide_backtraces.log"
    ".lazy.lua"
  ];
}
