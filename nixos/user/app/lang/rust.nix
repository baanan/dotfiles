{ pkgs, ... }:

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
  ];
  programs.git.enable = true;
  programs.git.ignores = [
    "bacon.toml"
    ".bacon-locations"
    ".vscode/"
  ];
}
