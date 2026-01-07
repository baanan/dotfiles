{ pkgs, bugstalker, system, profile, ... }:

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
  ] ++ (if profile != "macos" then [
    bugstalker.packages.${system}.default
  ] else []);
  programs.git.enable = true;
  programs.git.ignores = [
    "bacon.toml"
    ".bacon-locations"
    ".vscode/"
  ];
}
