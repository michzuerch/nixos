{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    terminal = "tmux-256color";
    shell = "${pkgs.fish}/bin/fish";
    historyLimit = 10000;
    clock24 = true;
    shortcut = "a";
    newSession = true;
    escapeTime = 0;
    secureSocket = false;
    keyMode = "vi";
    mouse = true;
    sensibleOnTop = true;
    catppuccin = {
      enable = true;
      extraConfig = ''
        set -g @catppuccin_flavour 'macchiato' # or latte, frappe, macchiato, mocha
        set -g @catppuccin_window_right_separator ""
        # set -g @catppuccin_window_right_separator "█"
        set -g @catppuccin_window_left_separator ""
        # set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_number_position "left"
        set -g @catppuccin_window_middle_separator " "
        set -g @catppuccin_window_default_text "#W"
        set -g @catppuccin_window_default_fill "none"
        set -g @catppuccin_window_current_fill "all"
        set -g @catppuccin_window_current_text "#W"
        set -g @catppuccin_status_modules_right "user host session"
        set -g @catppuccin_status_left_separator  " "
        # set -g @catppuccin_status_left_separator "█"
        set -g @catppuccin_status_right_separator ""
        # set -g @catppuccin_status_right_separator "█"
        set -g @catppuccin_status_right_separator_inverse "no"
        set -g @catppuccin_status_fill "all"
        set -g @catppuccin_status_connect_separator "no"
        set -g @catppuccin_directory_text "#{pane_current_path}"
      '';
    };
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
      tmuxPlugins.net-speed
      tmuxPlugins.catppuccin
      tmuxPlugins.sensible
      tmuxPlugins.continuum
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      # tmuxPlugins.tmux-fzf
    ];
    extraConfig = ''
      set -ag terminal-overrides ",$TERM:RGB"
    '';
  };

  home.packages = with pkgs; [byobu];
}
