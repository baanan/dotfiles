{ den, inputs, ... }:
{
  den.aspects.code = {
    includes = [
      den.aspects.default-langs
    ];
  };

  flake-file.inputs = {
    fenix.url = "github:nix-community/fenix";
  };

  den.aspects.default-langs.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      # rust
      (inputs.fenix.stable.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
        "rust-docs"
      ])
      bacon

      # python
      python315

      # typst
      typst
      typst-live
      tinymist

      # nix
      nil
      nixd

      # lua
      stylua
      lua-language-server
    ];
  };
}
