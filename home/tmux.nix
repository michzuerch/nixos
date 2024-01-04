{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shortcut = "b";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    plugins = with pkgs; [ 
      tmuxPlugins.better-mouse-mode 
      tmuxPlugins.resurrect
      tmuxPlugins.net-speed
      tmuxPlugins.nord
      tmuxPlugins.sensible
      tmuxPlugins.tmux-fzf
      tmuxPlugins.vim-tmux-navigator
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
    bind c new-window -c "#{pane_current_path}"


    # Resize and maximise panes
    bind -r j resize-pane -D 5
    bind -r k resize-pane -U 5
    bind -r l resize-pane -R 5
    bind -r h resize-pane -L 5
    
    bind -r m resize-pane -Z

    # Smart pane switching with awareness of Vim splits.
    # See: https://github.com/christoomey/vim-tmux-navigator
    is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
    bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
    bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
    bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
    bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
    tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
    if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
    if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

    bind-key -T copy-mode-vi 'C-h' select-pane -L
    bind-key -T copy-mode-vi 'C-j' select-pane -D
    bind-key -T copy-mode-vi 'C-k' select-pane -U
    bind-key -T copy-mode-vi 'C-l' select-pane -R
    bind-key -T copy-mode-vi 'C-\' select-pane -l

    '';
  };
}
