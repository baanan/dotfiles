{ pkgs, config, neovim-nightly-overlay, system, ... }:

{
  home.packages = with pkgs; [
    python313 clang nodePackages.npm wl-clipboard fzf
    neovim-nightly-overlay.packages.${system}.default
  ];
  # home.file.".config/nvim".source = ./../../../../common/neovim/config;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/projects/dotfiles/common/neovim/config";
  # home.file.".config/nvim".recursive = true;
  programs.neovim.withPython3 = true;

  programs.git.enable = true;
  programs.git.ignores = [
    "neovide_backtraces.log"
    ".lazy.lua"
  ];
}
