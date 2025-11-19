{ ... }:

{
  imports = [ 
    ./extensions.nix 
    ./theming.nix
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "vesktop.desktop"
        # "kitty.desktop"
        "com.mitchellh.ghostty.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
  };
}
