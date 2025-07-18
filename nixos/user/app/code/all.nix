{ ... }:

{
  imports = [ 
    ./java.nix 
    ./rust.nix 
    ./nvim.nix 
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      silent = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      userEmail = "thatepicbanana132@gmail.com";
      userName = "baanan";
    };
  };
}
