{  pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = "viins";
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    initExtra = ''
    bindkey "''${key[Up]}" up-line-or-search
    '';
  };

}
