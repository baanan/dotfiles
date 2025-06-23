{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza bat erdtree ripgrep fd
  ];

  programs.zsh.shellAliases = {
    ls = "exa --icons --group-directories-first";
    ll = "ls --long --header";
    la = "ll --all";
    erd = "erd --human --icons --layout inverted";
  };
}
