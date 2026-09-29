{ den, ... }:
{
  den.aspects.personal = {
    includes = [
      den.aspects.code
    ];
  };

  den.aspects.code.homeManager = { pkgs, ... }: {
    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true;
        silent = true;
        nix-direnv.enable = true;
      };

      git = {
        enable = true;
        userEmail = "thatepicbanana132@gmail.com";
        userName = "baanan";

        extraConfig = {
          safe = {
            directory = "*";
          };
        };
      };
    };
  };
}
