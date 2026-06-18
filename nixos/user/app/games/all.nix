{
  config,
  pkgs,
  pkgsUnstable,
  ...
}:

{
  imports = [
    ./minecraft.nix
    ./sdgyrodsu.nix
  ];

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
    "io.mrarm.mcpelauncher"
  ];

  home.packages = with pkgs; [
    # pkgsUnstable.gamescope
    pkgsUnstable.r2modman
    pkgsUnstable.cemu
  ];
}
