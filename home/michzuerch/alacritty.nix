_: {
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      font = {
        normal.family = "JetBrains Mono";
        bold.family = "JetBrains Mono";
        italic.family = "JetBrains Mono";
        size = 12;
      };
      window = {
        decorations = "none";
        dynamic_padding = true;
        opacity = 0.7;
        padding = {
          x = 5;
          y = 5;
        };
        startup_mode = "Maximized";
      };
      scrolling.history = 10000;
      colors.draw_bold_text_with_bright_colors = true;
      selection = {save_to_clipboard = true;};
    };
  };
}
