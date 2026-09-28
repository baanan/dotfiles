{ den, ... }:
{
  # personal desktop
  den.aspects.personal = {
    includes = [ den.aspects.minimal ];

    provides.to-hosts = { host }: {
      # Add thate as a default user.
      users.thate = {
        # And include the host aspect (so homeManager works).
        includes = [ host.aspect ];
      };
    };
  };
}
