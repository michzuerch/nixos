{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    catppuccin.enable = true;
    #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    plugins = [
      # inputs.hyprland-plugins.packages."${pkgs.system}".hyprexpo
    ];
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
    settings = {
      # "plugin:hyprexpo" = {
      #   columns = 3;
      #   gap_size = 5;
      #   bg_col = "rgb(111111)";
      #   workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1
      #   enable_gesture = true; # laptop touchpad, 4 fingers
      #   gesture_distance = 300; # how far is the "max"
      #   gesture_positive = true; # positive = swipe down. Negative = swipe up.
      # };

      # "plugin:borders-plus-plus" = {
      #   add_borders = 1;
      #   "col.border_1" = "rgb(ffffff)";
      #   "col.border_2" = "rgb(2222ff)";
      #   border_size_1 = 3;
      #   border_size_2 = -1;
      #   natural_rounding = "yes";
      # };
      exec-once = [
        "waybar"
        "swaync"
        "copyq --start-server"
        "lxqt-policykit-agent"
        "udiske"
        "blueman-applet"
        "nm-applet"
        "pypr"
        "hypridle"
        "gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'"
        "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
      ];
      exec = ["hyprpaper"];
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
        gaps_in = 10;
        gaps_out = 14;
        border_size = 1;
        resize_on_border = true;
        "col.active_border" = "rgba(0, 0, 0, 0)";
        "col.inactive_border" = "rgba(145, 190, 165, 0.32)";
        no_border_on_floating = true;
      };
      misc = {
        vfr = true;
        disable_hyprland_logo = false;
        disable_splash_rendering = false;
        mouse_move_enables_dpms = false;
        enable_swallow = true;
        swallow_regex = "^(alacritty)$";
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 12;
          passes = 4;
          new_optimizations = "on";
          ignore_opacity = true;
          xray = true;
          blurls = "waybar";
        };
        active_opacity = 0.9;
        inactive_opacity = 0.4;
        fullscreen_opacity = 0.9;
        drop_shadow = true;
        shadow_range = 30;
        shadow_render_power = 3;
        "col.shadow" = "0x66000000";
      };
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
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
        "float, viewnior"
        "float, feh"
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
        "float, ^(pavucontrol)$"
        "float,^(blueman-manager)$"
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
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        #  new_is_master = true;
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
        "SUPER SHIFT, Return, exec, kitty"
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
        # "SUPER, O, hyprexpo:expo, toggle"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER ALT, up, workspace, e+1"
        "SUPER ALT, down, workspace, e-1"
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop"
      ];
      binde = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
      bindle = [
        ", code:233, exec, brightnessctl -q s 2%+"
        ", code:232, exec, brightnessctl -q s 2%-"
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

  systemd.user.sessionVariables = {
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORM_THEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    NIXOS_OZONE_WL = "1";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    T_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    _JAVA_AWT_WM_NONREPARENTING = 1;
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_WEBRENDERER = "1";
    MOZ_ENABLE_WAYLAND = "1 firefox";
    HYPRCURSORSIZE = 128;
    XCURSORSIZE = 128;
  };

  home.packages = with pkgs; [
    nemo-with-extensions
    copyq
    ffmpegthumbnailer
    grimblast
    gsettings-desktop-schemas
    hyprpicker
    killall
    libsForQt5.filelight
    libsForQt5.qt5.qtwayland
    lxqt.lxqt-policykit
    networkmanagerapplet
    pamixer
    pavucontrol
    qt6.qtwayland
    shotman
    slurp
    sov
    squeekboard # virtual keyboard
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
    wlsunset
    wofi-emoji
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-utils
  ];
}
