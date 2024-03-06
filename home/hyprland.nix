{ config, lib, pkgs, inputs, ...}:
let 
  startup-script = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY
    ${pkgs.swaynotificationcenter}/bin/swaync &
    ${pkgs.copyq}/bin/copyq --start-server &
    ${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent &
    ${pkgs.udiskie}/bin/udiskie &
    ${pkgs.blueman}/bin/blueman-applet &
    ${pkgs.networkmanagerapplet}/bin/nm-applet &
    ${pkgs.hyprpaper}/bin/hyprpaper &
    ${pkgs.pyprland}/bin/pypr &
    ${pkgs.hypridle}/bin/hypridle
  '';
in 
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
    ];
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
    settings = {
      "plugin:borders-plus-plus" = {
        add_borders = 1;
        "col.border_1" = "rgb(ffffff)";
        "col.border_2" = "rgb(2222ff)";
        border_size_1 = 3;
        border_size_2 = -1;
        natural_rounding = "yes";
      };
      exec-once = ''${startup-script}/bin/start'';
      monitor = ",preferred,auto,1";
      xwayland = {
        force_zero_scaling = true;
      };
      input = {
        kb_layout = "us";
        repeat_delay = 350;
        repeat_rate = 50;
        accel_profile = "adaptive";
        follow_mouse = 2;
      };
      general = {
        layout = "dwindle";
        gaps_in = 7;
        gaps_out = 7;
        border_size = 4;
        resize_on_border = true;
        no_cursor_warps = false;
        no_border_on_floating = true;
        cursor_inactive_timeout = 30;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(alacritty)$";
      };
      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 0.7;
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
        };
        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "2 2";
        shadow_range = 4;
        shadow_render_power = 2;
      };
      animations = {
        enabled = true;
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 5, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "windowsMove, 1, 4, default"
          "border, 1, 10, default"
          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        no_gaps_when_only = false;
        pseudotile = true;
        preserve_split = true;
      };
      windowrule = [
        "float, file_progress"
        "float, confirm"
        "float, dialog"
        "float, download"
        "float, notification"
        "float, error"
        "float, splash"
        "float, confirmreset"
        "float, title:Open File"
        "float, title:branchdialog"
        "float, Lxappearance"
        "float, Rofi"
        "animation none,Rofi"
        "float,viewnior"
        "float,feh"
        "float, pavucontrol-qt"
        "float, pavucontrol"
        "float, file-roller"
        "fullscreen, wlogout"
        "float, title:wlogout"
        "fullscreen, title:wlogout"
        "idleinhibit fullscreen, firefox"
        "float, title:^(Media viewer)$"
        "float, title:^(Volume Control)$"
        "float, title:^(Picture-in-Picture)$"
        "size 800 600, title:^(Volume Control)$"
        "move 75 44%, title:^(Volume Control)$"
        "float, ^(blueberry.py)$"
      ];
      windowrulev2 = [
        "float,class:^(scratchpad)$"
        "size 80% 85%,class:^(scratchpad)$"
        "workspace special silent,class:^(scratchpad)$"
        "center,class:^(scratchpad)$"
      ];
      master = {
        new_is_master = true;
      };
      gestures = {
        workspace_swipe = "off";
      };
      layerrule = [
        "ignorezero, waybar"
        "ignorezero, wofi"
        "ignorezero, swaync-control-center"
        "ignorezero, swaync-notification-window"
        "blur, waybar"
        "blur, wofi"
        "blur, swaync-control-center"
        "blur, swaync-notification-window"
      ];
      bind = [
        "SUPER,Z,exec,pypr toggle term && hyprctl dispatch bringactivetotop" 
        "SUPER SHIFT, X, exec, hyprpicker -a -n"
        "CTRL ALT, L, exec, hyprlock"
        "SUPER, Return, exec, alacritty"
        "SUPER SHIFT, Return, exec, cool-retro-term"
        "SUPER, E, exec, nemo"
        "SUPER, D, exec, wofi --show drun --allow-images"
        "SUPER, period, exec, wofi-emoji"
        "SUPER, N, exec, swaync-client -t -sw"
        "SUPER, M, exec, wlogout --protocol layer-shell"
        "SUPER SHIFT, M, exit,"
        ", Print, exec, grimblast --notify --cursor copysave output"
        "ALT, Print, exec, grimblast --notify --cursor copysave screen"
        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exit,"
        "SUPER, F, fullscreen,"
        "SUPER, Space, togglefloating,"
        "SUPER, P, pseudo, "
        "SUPER, S, togglesplit, "
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"
        "SUPER CTRL, left, resizeactive, -20 0"
        "SUPER CTRL, right, resizeactive, 20 0"
        "SUPER CTRL, up, resizeactive, 0 -20"
        "SUPER CTRL, down, resizeactive, 0 20"
        "SUPER, g, togglegroup,"
        "SUPER, tab, changegroupactive,"
        "SUPER, grave, togglespecialworkspace,"
        "SUPERSHIFT, grave, movetoworkspace, special"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER ALT, up, workspace, e+1"
        "SUPER ALT, down, workspace, e-1"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop"
      ];
      binde= [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
      bindle = [
        ", XF86MonBrigthnessUp, exec, brightnessctl -q s 2%+"
        ", XF86MonBrigthnessDown, exec, brightnessctl -q s 2%-"
      ];
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };

  services.udiskie = {
    enable = true;
    tray = "always";
  };

  # Hyprpaper configuration file
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper/hyprpaper.conf;

  home.file.".config/hypr/pyprland.json".text = ''
    {
      "pyprland": {
        "plugins": ["scratchpads", "magnify"]
      },
      "scratchpads": {
        "term": {
          "command": "alacritty --class scratchpad",
          "margin": 50
        }
      }
    }
  '';

  home.file."config/hypr/hypridle.conf".text = ''
    $lock_cmd = pidof hyprlock || hyprlock
    $suspend_cmd = systemctl suspend

    general {
      lock_cmd = $lock_cmd
      before_sleep_cmd = $lock_cmd
      # after_sleep_cmd
    }

    listener {
      timeout = 30
      on-timeout = $lock_cmd
      # on-resume
    }
      
    # listener {
    #   timeout = 900
    #   on-timeout = $suspend_cmd
    #   # on-resume
    # }
  '';

  systemd.user.sessionVariables = {
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    NIXOS_OZONE_WL = "1";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    _JAVA_AWT_WM_NONREPARENTING = 1;
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_WEBRENDERER = "1";
  };

  home.packages = with pkgs; [
    cinnamon.nemo-with-extensions
    cool-retro-term
    copyq
    ffmpegthumbnailer
    grimblast
    gsettings-desktop-schemas
    hyprpaper
    hypridle
    hyprpicker
    killall
    libsForQt5.filelight
    libsForQt5.qt5.qtwayland
    lxqt.lxqt-policykit
    networkmanagerapplet
    pamixer
    pavucontrol
    pyprland
    qt6.qtwayland
    shotman
    slurp
    sov
    squeekboard #virtual keyboard
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
    wlsunset
    wofi-emoji
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
  ];
}
