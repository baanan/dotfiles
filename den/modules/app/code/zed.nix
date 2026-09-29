{ den, ... }:
{
  den.aspects.personal = {
    includes = [
      den.aspects.zed
    ];
  };

  den.aspects.zed.homeManager = { config, ... }: {
    programs.zed-editor = {
      enable = true;
    };

    home.file.".config/zed".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/projects/dotfiles/common/zed/config";
  };
}
