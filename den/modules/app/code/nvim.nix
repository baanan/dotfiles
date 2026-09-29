{ den, inputs, ... }:
{
  flake-file.inputs = {
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  den.aspects.personal = {
    includes = [
      den.aspects.nvim
    ];
  };

  den.aspects.nvim.homeManager =
    {
      pkgs,
      config,
      user,
      ...
    }:
    {
      home.packages = with pkgs; [
        fzf
        inputs.neovim-nightly-overlay.packages.${user.host.system}.default
        wl-clipboard
      ];

      home.file.".config/nvim".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/projects/dotfiles/common/neovim/config";

      programs.neovim = {
        defaultEditor = true;
      };

      programs.zsh.sessionVariables.EDITOR = "nvim";
    };
}
