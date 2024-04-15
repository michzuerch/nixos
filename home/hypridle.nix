{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home.file.".config/hypr/hypridle.conf".text = ''
    general {
      lock_cmd = $lock_cmd
      before_sleep_cmd = $lock_cmd
      ignore_dbus_inhibit = false
      # after_sleep_cmd
    }

    # dpms
    listener {
        timeout = 300
        on-timeout = hyprctl dispatch dpms off
        on-resume = hyprctl dispatch dpms on
    }

    # screenlock
    listener {
      timeout = 600
      on-timeout = hyprlock
      # on-resume
    }
  '';

  home.packages = with pkgs; [
    hypridle
  ];
}
