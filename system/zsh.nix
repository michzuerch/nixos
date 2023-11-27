{ config, pkgs, lib, ... }: {
   programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
  };

  #environment.systemPackages = with pkgs; [ virt-manager virt-viewer qemu ];
}
