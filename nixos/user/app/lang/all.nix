{ ... }:

{
  imports = [ 
    ./java.nix 
    ./rust.nix 
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
