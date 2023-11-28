{
  config, inputs, outputs, pkgs, ... }: 
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
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
  
  programs.command-not-found.enable = true;
    
  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    bat
    cowsay
    direnv 
    eza
    fd
    gcc
    gnumake
    gtop
    neofetch
    sqlite
    tealdeer
    unzip
  ];
}
