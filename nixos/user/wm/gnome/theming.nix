{ lib, ... }:

let
  background = "file://" + ./../shared/backgrounds/pixiv_97346596_cupoi_moescape_scenery_123star.png;
in {
  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/desktop/background" = {
      picture-uri = background;
      picture-uri-dark = background;
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = background;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "menu:minimize,maximize,spacer,close";
    };
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      color-scheme = "prefer-dark";
    };
  };
}
