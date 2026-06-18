{
  pkgs,
  config,
  pkgsUnstable,
  ...
}:

{
  home.packages = [
    (pkgs.callPackage ./sdgyrodsu-dev.nix { })
  ];
}
