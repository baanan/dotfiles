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

        settings = {
          user.email = "thatepicbanana132@gmail.com";
          user.name = "baanan";
          safe = {
            directory = "*";
          };

          commit.gpgsign = true;
          gpg.format = "ssh";
          user.signingkey = "~/.ssh/id_ed25519.pub";
        };

        ignores = [
          # direnv
          ".direnv"

          # editors
          ".vscode"
          ".zed"
        ];
      };
    };
  };
}
