{ den, ... }:
{
  den.aspects.personal = {
    includes = [ den.aspects.gnome ];
  };

  den.aspects.gnome = {
    nixos = {
      services.xserver.enable = true;

      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;
    };

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.gnomeExtensions.appindicator
        (pkgs.gnomeExtensions.pop-shell.overrideAttrs (_: {
          src = pkgs.fetchFromGitHub {
            owner = "pop-os";
            repo = "shell";
            rev = "7898b65c20735057faf0797f8ed056704ca55f0d";
            hash = "sha256-MmHoOxymo0QSRbRcSbFiv82+QWAwIwXwg/wyGQGVYiI=";
          };
        }))
      ];

      dconf.settings = {
        "org/gnome/shell" = {
          "enabled-extensions" = [
            "appindicatorsupport@rgcjonas.gmail.com"
            "dash-to-panel@jderose9.github.com"
            "pop-shell@system76.com"
          ];
        };
      };
    };
  };
}
