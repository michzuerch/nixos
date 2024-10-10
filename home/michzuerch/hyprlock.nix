{ pkgs, ... }: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = { disable_loading_bar = false; };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      image = [
        {
          monitor = "";
          # path = ~/.face.png
          size = 150;
          rounding = -1;
          border_size = 3;
          border_color = "rgb(255, 255, 255)";
          rotate = 0;
          reload_time = -1;
          reload_cmd = "";

          position = "0, 70";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [{
        monitor = "";
        size = "200, 30";
        outline_thickness = 2;
        outer_color = "rgb(255, 255, 255)";
        inner_color = "rgb(255, 255, 255)";

        font_color = "rgb(255, 255, 255)";
        fade_on_empty = false;

        position = "0, -70";
        halign = "center";
        valign = "center";
      }];

      label = [
        {
          monitor = "";
          text = "$TIME"; # Text rendered in the label.
          color = "rgb(255,255,255)";
          font_size = 130;
          font_family = "Noto Sans";

          position = "0, 340";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "<b>  </b>"; # Text rendered in the label.
          color = "rgb(255,255,255)";
          font_size = 80;
          font_family = "Noto Sans";

          position = "0, -400";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
