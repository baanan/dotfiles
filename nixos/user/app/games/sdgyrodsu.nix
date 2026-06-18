{
  pkgs,
  config,
  pkgsUnstable,
  ...
}:

{
  home.packages = [
    pkgs.stdenv.mkDerivation
    {
      pname = "sdgyrodsu";
      version = "2.6";

      src = pkgs.fetchFromGitHub {
        owner = "kmicki";
        repo = "SteamDeckGyroDSU";
        rev = "master";
      };

      nativeBuildInputs = with pkgs; [
        ncurses
        systemd
        hidapi
      ];

      NOPREPARE = "true";
    }
  ];
}
