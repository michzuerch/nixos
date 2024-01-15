{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shortcut = "b";
    baseIndex = 1;
    newSession = true;
    escapeTime = 50;
    secureSocket = false;
    plugins = with pkgs; [ 
      tmuxPlugins.better-mouse-mode 
      tmuxPlugins.resurrect
      tmuxPlugins.net-speed
      tmuxPlugins.nord
      tmuxPlugins.sensible
      tmuxPlugins.tmux-fzf
    ];
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
    '';
  };
}
