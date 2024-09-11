_: {
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      font = {size = 12;};
      window = {
        opacity = 0.7;
        padding = {
          x = 15;
          y = 15;
        };
      };
      selection = {save_to_clipboard = true;};
    };
  };
}
# [font.normal]
# family = "FiraCode Nerd Font"
# style = "Regular"

