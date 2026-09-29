{ den, ... }:
{
  den.aspects.personal = {
    includes = [ den.aspects.transfer ];
  };

  den.aspects.apps-system.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      nextcloud-client
      bitwarden-desktop
      filezilla
      sshfs
      p7zip
      unzip
    ];
  };
}
