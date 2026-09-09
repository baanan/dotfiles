{ den, ... }:
{
  # host configuration
  den.hosts.x86_64-linux.desktop = {
    # user configuration
    users.thate = { };
  };

  # host aspect
  den.aspects.desktop = {
    includes = [
      den.aspects.work
      den.aspects.gaming
    ];
  };
}
