{ pkgs, ... }:

# let
#   background = "file://" + ./../shared/backgrounds/pixiv_97346596_cupoi_moescape_scenery_123star_blurred-50_darkened-80.png;
# in {
#   nixpkgs = {
#     overlays = [
#       (self: super: {
#        gnome = super.gnome.overrideScope' (selfg: superg: {
#            gnome-shell = superg.gnome-shell.overrideAttrs (old: {
#                patches = (old.patches or []) ++ [
#                (pkgs.substituteAll {
#                 src = ./gnome-shell_3.38.3-3ubuntu1_3.38.3-3ubuntu2.patch;
#                 })
#                ];
#                });
#            });
#        })
#     ];
#   };
#
#   services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
# [com.ubuntu.login-screen]
# background-repeat='no-repeat'
# background-size='cover'
# background-color='#777777'
# background-picture-uri='${ background }'
# '';
# }
{}
