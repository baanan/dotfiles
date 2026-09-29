{ den, ... }:
{
  den.aspects.minimal = {
    includes = [
      den.aspects.terminal-utils
    ];
  };

  den.aspects.terminal-utils.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      eza
      bat
      erdtree
      ripgrep
      fd
      git
    ];
  };
}
