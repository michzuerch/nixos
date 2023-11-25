{
  config, inputs, outputs, pkgs, ... }: 
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHightlighting.enable = true;
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

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    neofetch
    fd
    cat
    direnv 
    eza
    cowsay
    nix-direnv
  ];

}
