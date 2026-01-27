{ pkgs, pkgsUnstable, profile, lib, ... }:

lib.recursiveUpdate {
  imports = [
    ./java.nix
    ./rust.nix
    ./nvim.nix
    ./lua.nix
    ./c.nix
    ./js.nix
    ./ruby.nix
    ./zed.nix
    ./nix.nix
    ./go.nix
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      silent = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      userEmail = "thatepicbanana132@gmail.com";
      userName = "baanan";

      extraConfig = {
        safe = {
          directory = "*";
        };
      };
    };
  };

  home.packages = with pkgs; [
    tree-sitter gdb
    # typst
    typst typst-live
  ] ++ (if profile != "macos" then [
    thonny
  ] else []);
}
(if profile != "macos" then {
  services.flatpak.packages = [
    "org.gnome.design.IconLibrary"
  ];
} else {})
