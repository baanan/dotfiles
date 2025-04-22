{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jdk21 eclipses.eclipse-java
  ];
}
