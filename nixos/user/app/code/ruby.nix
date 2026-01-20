{ pkgs, system, profile, ... }:

{
  home.packages = with pkgs; [
    rubyPackages.solargraph rubocop ruby
  ];
}
