{ pkgs, bugstalker, ... }:

{
  home.packages = with pkgs; [
    (fenix.stable.withComponents [
     "cargo"
     "clippy"
     "rust-src"
     "rustc"
     "rustfmt"
     "rust-docs"
    ])
    bacon
    bugstalker.packages."x86_64-linux".default
  ];
  programs.git.enable = true;
  programs.git.ignores = [
    "bacon.toml"
    ".bacon-locations"
    ".vscode/"
  ];
}
