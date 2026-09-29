{ den, ... }:
{
  den.aspects.gnome = {
    includes = [ den.aspects.gnome.blur-my-shell ];
  };

  den.aspects.gnome.blur-my-shell = {
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.gnomeExtensions.blur-my-shell
      ];

      dconf.settings = {
        "org/gnome/shell" = {
          enabled-extensions = [
            "blur-my-shell@aunetx"
          ];
        };
        "org/gnome/shell/extensions/blur-my-shell/applications" = {
          blur = true;
          dynamic-opacity = false;
          whitelist = [
            "kitty"
            "com.mitchellh.ghostty"
          ];
        };
        "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
          blur = true;
          brightness = 0.6;
          pipeline = "pipeline_default_rounded";
          sigma = 30;
          static-blur = true;
          style-dash-to-dock = 0;
        };
        "org/gnome/shell/extensions/blur-my-shell/panel" = {
          pipeline = "pipeline_default";
          brightness = 0.6;
          sigma = 30;
        };
        "org/gnome/shell/extensions/blur-my-shell/window-list" = {
          brightness = 0.6;
          sigma = 30;
        };
        "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
          brightness = 0.6;
          sigma = 30;
        };
        "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
          pipeline = "pipeline_default";
        };
        "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
          pipeline = "pipeline_default";
        };
        "org/gnome/shell/extensions/blur-my-shell/overview" = {
          pipeline = "pipeline_default";
        };
        "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
          pipeline = "pipeline_default";
        };
      };
    };
  };
}
