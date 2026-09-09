{ den, ... }:
{
  den.aspects.minimal = {
    includes = [
      den.aspects.connect.firefox
    ];
  };

  den.quirks.defaultFirefoxProfile = {
    description = "the default profile to use for firefox";
  };

  den.aspects.desktop.defaultFirefoxProfile = "default";
  den.aspects.laptop.defaultFirefoxProfile = "school";

  den.aspects.connect.firefox = { defaultFirefoxProfile, ... }: {
    homeManager =
      let
        default =
          if builtins.length defaultFirefoxProfile > 0 then
            builtins.elemAt defaultFirefoxProfile 0
          else
            "default";
      in
      {
        programs.firefox = {
          enable = true;
          profiles = {
            default = {
              id = 0;
              name = "default";
              isDefault = default == "default";
            };
            school = {
              id = 1;
              name = "school";
              isDefault = default == "school";
            };
            guest = {
              id = 2;
              name = "guest";
              isDefault = default == "guest";
            };
          };
        };
      };
  };
}
