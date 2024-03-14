{pkgs, modulesPath, ... }:

{
  imports = [
   "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  system.stateVersion = "24.05";
}
