{ config, lib, pkgs, inputs, ...}:
{
  home.file.".config/hypr/hyprlock.conf".text = ''
  background {
    monitor =
    path = $HOME/Wallpapers/hyprlock.png<Down>  # only png supported for now
    color = rgba(25, 20, 20, 1.0)

    # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
    blur_passes = 4 # 0 disables blurring
    blur_size = 2
    noise = 0.0117
    contrast = 0.8916
    brightness = 0.8172
    vibrancy = 0.1696
    vibrancy_darkness = 0.0
}

input-field {
    monitor =
    size = 200, 50
    outline_thickness = 1
    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 0.15 # Scale of dots' absolute size, 0.0 - 1.0
    dots_center = true
    outer_color = rgb(000000)
    inner_color = rgb(200, 200, 200)
    font_color = rgb(10, 10, 10)
    fade_on_empty = true
    placeholder_text = <i>Input Password...</i> # Text rendered in the input box when it's empty.
    hide_input = false
    position = 0, -20
    halign = center
    valign = center
}

label {
    monitor =
    text = Enter your password to unlock
    color = rgba(200, 200, 200, 1.0)
    font_size = 25
    font_family = Noto Sans

    position = 0, 200
    halign = center
    valign = center
}




  # BACKGROUND
background {
    monitor =
    path = $HOME/Wallpapers/hyprlock.png
    blur_passes = 2
    contrast = 0.8916
    brightness = 0.8172
    vibrancy = 0.1696
    vibrancy_darkness = 0.0
}

# GENERAL
general {
    no_fade_in = false
    grace = 30
    disable_loading_bar = false
}

# INPUT FIELD
input-field {
    monitor =
    size = 250, 60
    outline_thickness = 2
    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
    dots_center = true
    outer_color = rgba(0, 0, 0, 0)
    inner_color = rgba(30, 30, 46, 0.3)
    font_color = rgb(200, 200, 200)
    fade_on_empty = false
    font_family = SF Pro Display Bold
    placeholder_text = <i><span foreground="##ffffff99">Use Me</span></i>
    hide_input = false
    position = 0, -120
    halign = center
    valign = center
}

# TIME
label {
    monitor =
    text = cmd[update:1000] echo "$(date +"%-I:%M%p")"
    color = rgba(195, 55, 100, 1)
    font_size = 120
    font_family = SF Pro Display Bold
    position = 0, -200
    halign = center
    valign = top
}

# USER
label {
    monitor =
    text = $USER
    color = rgba(255, 187, 0, .9)
    font_size = 40
    font_family = SF Pro Display Bold
    position = 75, 90
    halign = center
    valign = center
}
  '';

  home.packages = with pkgs; [
    hyprlock
  ];
}
