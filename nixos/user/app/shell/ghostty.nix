{ pkgs, ... }:

{
  home.packages = [ pkgs.ghostty ];
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "tokyonight_moon";
      mouse-scroll-multiplier = 0.5;
      background-opacity = 0.8;
      maximize = true;
      # window-show-tab-bar = "never";
      gtk-tabs-location = "hidden";
      keybind = [
        "ctrl+q=close_surface"

        "ctrl+v=new_split:right"
        "ctrl+s=new_split:down"

        "ctrl+alt+h=goto_split:left"
        "ctrl+alt+j=goto_split:down"
        "ctrl+alt+k=goto_split:up"
        "ctrl+alt+l=goto_split:right"

        "alt+shift+h=resize_split:left,1"
        "alt+shift+j=resize_split:down,1"
        "alt+shift+k=resize_split:up,1"
        "alt+shift+l=resize_split:right,1"

        "ctrl+shift+t=new_tab"
        "ctrl+shift+h=previous_tab"
        "ctrl+shift+l=next_tab"

        "ctrl+shift+f=toggle_fullscreen"
      ];
    };
  };
}
