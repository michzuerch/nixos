{  pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = "viins";
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
  };
}
