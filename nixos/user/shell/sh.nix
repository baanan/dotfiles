{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-posh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;

    initExtra = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      mkcdir () {
          mkdir -p $1;
          cd $1;
      }
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "z" ];
    };
  };

  programs.oh-my-posh = {
    enable = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ../../../common/config/omp/takuya.omp.json ));
  };
}
