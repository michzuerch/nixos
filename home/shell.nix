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
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    plugins = with pkgs; [ tmuxPlugins.better-mouse-mode ];
    extraConfig = ''
    # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
    set -g default-terminal "xterm-256color"
    set -ga terminal-overrides ",*256col*:Tc"
    set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
    set-environment -g COLORTERM "truecolor"

    # Mouse works as expected
    set-option -g mouse on
    # easy-to-remember split pane commands
    bind | split-window -h -c "#{pane_current_path}"
    bind - split-window -v -c "#{pane_current_path}"
    bind c new-window -c "#{pane_current_path}"
    '';
  };
    
  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    neofetch
    fd
    bat
    direnv 
    eza
    cowsay
    nix-direnv
  ];

}
