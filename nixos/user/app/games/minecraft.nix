{ pkgs, config, pkgsUnstable, ... }:

{
  home.packages = [
    # pkgsUnstable.prismlauncher
  ];

  services.flatpak.packages = [
    "org.prismlauncher.PrismLauncher"
  ];
}
