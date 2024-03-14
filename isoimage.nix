{pkgs, modulesPath, ... }:
{
  imports = [
   "${modulesPath}/installer/cd-dvd/installation-cd-plasma5.nix"
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.05";
}
