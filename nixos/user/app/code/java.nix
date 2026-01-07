{ pkgs, profile, ... }:

{
  home.packages = with pkgs; [
    jdk21
  ] ++ (if profile != "macos" then [
    eclipses.eclipse-java
  ] else []);
}
