{ config, lib, pkgs, inputs, ...}:
{
  home.file.".config/hypr/frappe.conf".text = ''
    $rosewaterAlpha = f2d5cf
    $flamingoAlpha  = eebebe
    $pinkAlpha      = f4b8e4
    $mauveAlpha     = ca9ee6
    $redAlpha       = e78284
    $maroonAlpha    = ea999c
    $peachAlpha     = ef9f76
    $yellowAlpha    = e5c890
    $greenAlpha     = a6d189
    $tealAlpha      = 81c8be
    $skyAlpha       = 99d1db
    $sapphireAlpha  = 85c1dc
    $blueAlpha      = 8caaee
    $lavenderAlpha  = babbf1

    $textAlpha      = c6d0f5
    $subtext1Alpha  = b5bfe2
    $subtext0Alpha  = a5adce

    $overlay2Alpha  = 949cbb
    $overlay1Alpha  = 838ba7
    $overlay0Alpha  = 737994

    $surface2Alpha  = 626880
    $surface1Alpha  = 51576d
    $surface0Alpha  = 414559

    $baseAlpha      = 303446
    $mantleAlpha    = 292c3c
    $crustAlpha     = 232634

    $rosewater = 0xfff2d5cf
    $flamingo  = 0xffeebebe
    $pink      = 0xfff4b8e4
    $mauve     = 0xffca9ee6
    $red       = 0xffe78284
    $maroon    = 0xffea999c
    $peach     = 0xffef9f76
    $yellow    = 0xffe5c890
    $green     = 0xffa6d189
    $teal      = 0xff81c8be
    $sky       = 0xff99d1db
    $sapphire  = 0xff85c1dc
    $blue      = 0xff8caaee
    $lavender  = 0xffbabbf1

    $text      = 0xffc6d0f5
    $subtext1  = 0xffb5bfe2
    $subtext0  = 0xffa5adce

    $overlay2  = 0xff949cbb
    $overlay1  = 0xff838ba7
    $overlay0  = 0xff737994

    $surface2  = 0xff626880
    $surface1  = 0xff51576d
    $surface0  = 0xff414559

    $base      = 0xff303446
    $mantle    = 0xff292c3c
    $crust     = 0xff232634
  '';

  home.file.".config/hypr/hyprlock.conf".text = ''
    source = $HOME/.config/hypr/frappe.conf

    $font = JetBrainsMono Nerd Font

    # GENERAL
    general {
      grace = 30
      disable_loading_bar = true
    }

    # BACKGROUND
    background {
      monitor =
      path = $HOME/Wallpapers/hyprlock.png
      blur_passes = 2
      # color = $base
    }

    # TIME
    label {
        monitor =
        text = cmd[update:30000] echo "$(date +"%R")"
        color = $text
        font_size = 90
        font_family = $font
        position = -30, 0
        halign = right
        valign = top
    }
    # DATE
    label {
        monitor =
        text = cmd[update:43200000] echo "$(date +"%A,%e %B %Y")"
        color = $text
        font_size = 25
        font_family = $font
        position = -30, -150
        halign = right
        valign = top
    }

    # USER
    label {
        monitor =
        text = Logging in as <span foreground="##$tealAlpha">$USER</span>
        color = $text
        font_size = 25
        font_family = $font
        position = 0, 50
        halign = center
        valign = center
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 300, 60
        outline_thickness = 2
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = $surface0
        inner_color = $surface0
        font_color = $text
        fade_on_empty = false
        placeholder_text = <i><span foreground="##$textAlpha">Input Password...</span></i>
        hide_input = false
        position = 0, -50
        halign = center
        valign = center
    }

  '';

  home.packages = with pkgs; [
    hyprlock
  ];
}
