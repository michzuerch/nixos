{  pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    initExtra = ''
    '';
  };

}
