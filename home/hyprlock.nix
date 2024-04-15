{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home.file.".config/hypr/hyprlock.conf".text = ''

    general {
        no_fade_in = false
        grace = 30
        disable_loading_bar = false
    }

    background {
      monitor =
      path = $HOME/Wallpapers/hyprlock.png  # only png supported for now
      color = rgba(25, 20, 20, 1.0)
      blur_passes = 3 # 0 disables blurring
      blur_size = 4
      noise = 0.0117
      contrast = 1.3000
      brightness = 0.8000
      vibrancy = 0.2100
      vibrancy_darkness = 0.0
    }

    input-field {
      monitor =
      size = 250, 50
      outline_thickness = 3
      dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
      dots_spacing = 0.64 # Scale of dots' absolute size, 0.0 - 1.0
      dots_center = true
      outer_color = rgb(000000)
      inner_color = rgb(200, 200, 200)
      font_color = rgb(10, 10, 10)
      fade_on_empty = true
      placeholder_text = <i>Password...</i> # Text rendered in the input box when it's empty.
      hide_input = false
      position = 0, 150
      halign = center
      valign = center
    }

    label {
      monitor =
      text = cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"
      color = rbga(200, 200, 200, 1.0)
      font_size = 64
      font_family = JetBrains Mono Nerd Font 10
      position = 0, 16
      halign = center
      valign = center
    }

    label {
      monitor =
      text = Hey <span text_transform="capitalize" size="larger">$USER</span>
      color = $color0
      font_size = 20
      font_family = JetBrains Mono Nerd Font 10
      position = 0, 0
      halign = center
      valign = center
    }


  '';

  home.packages = with pkgs; [
    hyprlock
  ];
}
