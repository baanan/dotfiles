{ den, ... }:
{
  den.aspects.personal = {
    includes = [ den.aspects.transfer ];
  };

  den.aspects.transfer.homeManager = { pkgs, ... }: {
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
