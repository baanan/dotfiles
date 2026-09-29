{ den, ... }:
{
  den.schema.host = {
    # Add thate as a default user.
    #
    # There is absolutely no way to make this a setting configurable by aspects, since policies
    # can't use configuration defined by aspects. This includes quirks, since they're collected
    # after all entities are defined.
    users.thate = { };
  };

  # user aspect
  den.aspects.thate = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user

      den.batteries.host-aspects
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
