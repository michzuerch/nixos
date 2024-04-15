{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = "viins";
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
  };
}
