{ den, ... }:
{
  # home configuration
  # den.homes.x86_64-linux.thate = { };

  # user aspect
  den.aspects.thate = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user

      den.aspects.secrets

      (den.batteries.user-shell "zsh")
    ];

    nixos = {
      users.mutableUsers = true;
      users.users.thate = {
        # TODO: use sops for password
        initialPassword = "password";
        description = "Brennan Craig";
      };
    };

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.htop ];
    };
  };
}
