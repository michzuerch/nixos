{pkgs, modulesPath, ... }:
{
  imports = [
   "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.05";
}
