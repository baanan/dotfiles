{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.kdiskmark
  ];

  services.cloudflare-warp = {
    enable = true;
  };
}
