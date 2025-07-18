{ pkgs, ... }:

{
  home.packages = [ pkgs.kitty ];
  programs.kitty = {
    enable = true;
    themeFile = "OneHalfDark";
    font = { 
      name = "JetBrainsMonoNL Nerd Font" ;
    };
    settings = {
       enabled_layouts = "splits";
       background_opacity = 0.5;	
       linux_display_server = "x11";
    };
    keybindings = {
      "ctrl+q" = "close_window";

      "ctrl+v" = "launch --location=vsplit";
      "ctrl+s" = "launch --location=hsplit";

      "ctrl+alt+h" = "neighboring_window left";
      "ctrl+alt+j" = "neighboring_window down";
      "ctrl+alt+k" = "neighboring_window up";
      "ctrl+alt+l" = "neighboring_window right";

      "alt+shift+h" = "resize_window narrower";
      "alt+shift+j" = "resize_window shorter";
      "alt+shift+k" = "resize_window taller";
      "alt+shift+l" = "resize_window wider";
    };
  };
}
