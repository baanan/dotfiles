{ pkgs, system, profile, ... }:

{
  home.packages = with pkgs; [
    ruby-lsp rubocop
  ];
}
