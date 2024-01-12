{  pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = "~/.config/zsh";
    initExtra = ''
    PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
     %F{green}→%f "
    RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
    '';
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.bat.enable = true;
  
  programs.fzf = {
    enable = true;
    defaultCommand =
      "fd --type f --hidden --no-ignore --follow --exclude .git";
    enableZshIntegration = true;
    enableFishIntegration = false;
  };

  programs.jq.enable = true;
  
  programs.gitui.enable = true;

  programs.dircolors.enable = true;

  #programs.command-not-found.enable = true;
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
    
  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    bandwhich
    bat
    cowsay
    delta
    direnv 
    du-dust
    eza
    fd
    gcc
    gnumake
    grex
    gtop
    krusader
    neofetch
    procs
    pwgen
    sd
    sqlite
    tealdeer
    tokei
    unzip
  ];
}
