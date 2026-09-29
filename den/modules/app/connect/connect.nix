{ den, ... }:
{
  den.aspects.personal = {
    includes = [
      den.aspects.connect
    ];
  };

  den.aspects.connect = {
    includes = [
      (den.batteries.unfree [ "google-chrome" ])
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.vesktop
        pkgs.google-chrome
      ];
    };
  };
}
