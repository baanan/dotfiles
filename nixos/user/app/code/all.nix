{ pkgs, pkgsUnstable, ... }:

{
  imports = [ 
    ./java.nix 
    ./rust.nix 
    ./nvim.nix 
    ./lua.nix 
    ./c.nix 
    ./js.nix 
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

  services.flatpak.packages = [
    "org.gnome.design.IconLibrary"
  ];

  home.packages = with pkgs; [
    thonny tree-sitter gdb
  ];
}
