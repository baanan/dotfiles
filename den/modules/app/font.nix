{ den, ... }:
{
  den.aspects.personal.includes = [ den.aspects.font ];

  den.aspects.font.nixos = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      jetbrains-mono
    ];
  };
}
