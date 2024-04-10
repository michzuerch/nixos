{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    catppuccin.enable = true;
    clock24 = true;
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
      tmuxPlugins.net-speed
      tmuxPlugins.nord
      tmuxPlugins.sensible
      # tmuxPlugins.tmux-fzf
    ];
    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };

  home.packages = with pkgs; [
    byobu
  ];
}
