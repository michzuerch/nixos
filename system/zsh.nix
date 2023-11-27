{ config, pkgs, lib, ... }: {
   programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      #syntaxHighlighting.highlighters = ["main" "brackets" "pattern" "cursor" "line"];
      #syntaxHighlighting.patterns = {};
      #syntaxHighlighting.styles = {"globbing" = "none";};
      history = {
        size = 10000;
	save = 10000;
	ignoreDups = true;
	expireDuplicatesFirst = true;
	share = true;
	extended = true;
      };
  };

  #environment.systemPackages = with pkgs; [ virt-manager virt-viewer qemu ];
}
