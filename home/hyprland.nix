{ config, lib, pkgs, inputs, ...}: {
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

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland = {
      enable = true;
    };

    systemd.enable = true;
    plugins = [];
    settings = {};
    extraConfig = ''
      # █▀▀ ▀▄▀ █▀▀ █▀▀
      # ██▄ █░█ ██▄ █▄▄
      exec-once = dbus-update-activation-environment DISPLAY XAUTHORITY WAYLAND_DISPLAY 
      exec-once = swaync
      exec-once = waybar
      # exec-once = pypr
      # exec-once = swayidle -w
      exec-once = sleep 4 && gnome-keyring-daemon --start --components=secrets
      exec-once = copyq --start-server &
      exec-once = lxqt-policykit-agent & udiskie &
      #exec-once = sleep 8 && poweralertd 
      exec-once = blueman-applet
      exec-once = nm-applet 
      exec-once = hyprpaper
      exec-once = swayidle -w timeout 90 '${config.programs.swaylock.package}/bin/swaylock -f' timeout 210 'suspend-unless-render' resume '${pkgs.hyprland}/bin/hyprctl dispatch dpms on' before-sleep "${config.programs.swaylock.package}/bin/swaylock -f"

      ############################################# misc #############################################
      # █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
      # █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄
      monitor=,preferred,auto,1

      xwayland {
        force_zero_scaling = true
      }

      # █ █▄░█ █▀█ █░█ ▀█▀
      # █ █░▀█ █▀▀ █▄█ ░█░
      input {
        kb_layout = us
        # sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        # kb_options = caps:escape
        repeat_delay = 350
        repeat_rate = 50
        accel_profile = adaptive
        follow_mouse = 2
      }

      # █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ █░░
      # █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ █▄▄
      general {
        layout = dwindle
        gaps_in = 7
        gaps_out = 7
        border_size = 4
        resize_on_border = true
        no_cursor_warps = false
        no_border_on_floating = true
        cursor_inactive_timeout = 30
      }

      # █▀▄▀█ █ █▀ █▀▀
      # █░▀░█ █ ▄█ █▄▄
      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
        mouse_move_enables_dpms = true
        enable_swallow = true
        swallow_regex = ^(kitty)$
      }

      env = QT_QPA_PLATFORMTHEME,qt5ct
      env = XCURSOR_SIZE,24
      env = WLR_NO_HARDWARE_CURSORS,1

      # █▀▄ █▀▀ █▀▀ █▀█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
      # █▄▀ ██▄ █▄▄ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█

      decoration {
        # █▀█ █▀█ █░█ █▄░█ █▀▄   █▀▀ █▀█ █▀█ █▄░█ █▀▀ █▀█
        # █▀▄ █▄█ █▄█ █░▀█ █▄▀   █▄▄ █▄█ █▀▄ █░▀█ ██▄ █▀▄
        rounding = 8
        #multisample_edges = true

        # █▀█ █▀█ ▄▀█ █▀▀ █ ▀█▀ █▄█
        # █▄█ █▀▀ █▀█ █▄▄ █ ░█░ ░█░
        active_opacity = 1.0
        inactive_opacity = 0.7

        # █▄▄ █░░ █░█ █▀█
        # █▄█ █▄▄ █▄█ █▀▄
        blur {
          enabled = true
          size = 5
          passes = 2
          new_optimizations = true
          ignore_opacity = true
        }


        # █▀ █░█ ▄▀█ █▀▄ █▀█ █░█░█
        # ▄█ █▀█ █▀█ █▄▀ █▄█ ▀▄▀▄▀
        drop_shadow = true
        shadow_ignore_window = true
        shadow_offset = 2 2
        shadow_range = 4
        shadow_render_power = 2
        col.shadow = 0x66000000

        blurls = gtk-layer-shell
        # blurls = waybar
        blurls = lockscreen
      }

      # ▄▀█ █▄░█ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
      # █▀█ █░▀█ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█
      animations {
        enabled = true
        # █▄▄ █▀▀ ▀█ █ █▀▀ █▀█   █▀▀ █░█ █▀█ █░█ █▀▀
        # █▄█ ██▄ █▄ █ ██▄ █▀▄   █▄▄ █▄█ █▀▄ ▀▄▀ ██▄
        bezier = overshot, 0.05, 0.9, 0.1, 1.05
        bezier = smoothOut, 0.36, 0, 0.66, -0.56
        bezier = smoothIn, 0.25, 1, 0.5, 1

        animation = windows, 1, 5, overshot, slide
        animation = windowsOut, 1, 4, smoothOut, slide
        animation = windowsMove, 1, 4, default
        animation = border, 1, 10, default
        animation = fade, 1, 10, smoothIn
        animation = fadeDim, 1, 10, smoothIn
        animation = workspaces, 1, 6, default
      }

      # █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
      # █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█

      dwindle {
        no_gaps_when_only = false
        pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # you probably want this
      }

      # █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
      # ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█
      windowrule = float, file_progress
      windowrule = float, confirm
      windowrule = float, dialog
      windowrule = float, download
      windowrule = float, notification
      windowrule = float, error
      windowrule = float, splash
      windowrule = float, confirmreset
      windowrule = float, title:Open File
      windowrule = float, title:branchdialog
      windowrule = float, Lxappearance
      windowrule = float, Rofi
      windowrule = animation none,Rofi
      windowrule = float,viewnior
      windowrule = float,feh
      windowrule = float, pavucontrol-qt
      windowrule = float, pavucontrol
      windowrule = float, file-roller
      windowrule = fullscreen, wlogout
      windowrule = float, title:wlogout
      windowrule = fullscreen, title:wlogout
      windowrule = idleinhibit focus, mpv
      windowrule = idleinhibit fullscreen, firefox
      windowrule = float, title:^(Media viewer)$
      windowrule = float, title:^(Volume Control)$
      windowrule = float, title:^(Picture-in-Picture)$
      windowrule = size 800 600, title:^(Volume Control)$
      windowrule = move 75 44%, title:^(Volume Control)$
      windowrule = float, ^(blueberry.py)$

      # # scratchpad pyprland
      # $scratchpadsize = size 80% 85%
      # $scratchpad = class:^(scratchpad)$
      # windowrulev2 = float,$scratchpad
      # windowrulev2 = $scratchpadsize,$scratchpad
      # windowrulev2 = workspace special silent,$scratchpad
      # windowrulev2 = center,$scratchpad

      $pavucontrol = class:^(pavucontrol)$
      windowrulev2 = float,$pavucontrol
      windowrulev2 = size 86% 40%,$pavucontrol
      windowrulev2 = move 50% 6%,$pavucontrol
      windowrulev2 = workspace special silent,$pavucontrol
      windowrulev2 = opacity 0.80,$pavucontrol
      windowrulev2 = float,title:^(Kdenlive)$

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe = off
      }

      # █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄
      # █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀
      bind = SUPER SHIFT, X, exec, hyprpicker -a -n
      bind = CTRL ALT, L, exec, swaylock
      bind = SUPER, Return, exec, alacritty
      bind = SUPER SHIFT, Return, exec, cool-retro-term
      bind = SUPER, E, exec, nemo
      bind = SUPER, D, exec, wofi --show drun --allow-images
      bind = SUPER, period, exec, wofi-emoji

      # Toggle Waybar
      # bind = SUPER, B, exec, killall -SIGUSR1 waybar 

      bind = SUPER, N, exec, swaync-client -t -sw
      bind = SUPER, L, exec, swayidle
      bind = SUPER, M, exec, wlogout --protocol layer-shell
      bind = SUPER SHIFT, M, exit,
      bind = ,Print, exec, shotman --capture output

      # █▀▄▀█ █░█ █░░ ▀█▀ █ █▀▄▀█ █▀▀ █▀▄ █ ▄▀█
      # █░▀░█ █▄█ █▄▄ ░█░ █ █░▀░█ ██▄ █▄▀ █ █▀█
      binde=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      binde=, XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      binde=, XF86MonBrightnessUp, exec, brightnessctl set +10% 
      binde=, XF86MonBrightnessDown, exec, brightnessctl set 10%-

      # █▀ █▀▀ █▀█ █▀▀ █▀▀ █▄░█ █▀ █░█ █▀█ ▀█▀
      # ▄█ █▄▄ █▀▄ ██▄ ██▄ █░▀█ ▄█ █▀█ █▄█ ░█░
      $screenshotarea = hyprctl keyword animation "fadeOut,0,0,default"; grimblast --notify copysave area; hyprctl keyword animation "fadeOut,1,4,default"
      bind = SUPER SHIFT, S, exec, $screenshotarea
      bind = , Print, exec, grimblast --notify --cursor copysave output
      bind = ALT, Print, exec, grimblast --notify --cursor copysave screen

      # █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▄▀█ █▀▀ █▄░█ ▀█▀
      # ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █░▀░█ █▀█ █░▀█ █▀█ █▄█ █░▀░█ ██▄ █░▀█ ░█░
      bind = SUPER, Q, killactive,
      bind = SUPER SHIFT, Q, exit,
      bind = SUPER, F, fullscreen,
      bind = SUPER, Space, togglefloating,
      bind = SUPER, P, pseudo, # dwindle
      bind = SUPER, S, togglesplit, # dwindle

      # █▀▀ █▀█ █▀▀ █░█ █▀
      # █▀░ █▄█ █▄▄ █▄█ ▄█
      bind = SUPER, left, movefocus, l
      bind = SUPER, right, movefocus, r
      bind = SUPER, up, movefocus, u
      bind = SUPER, down, movefocus, d

      # █▀▄▀█ █▀█ █░█ █▀▀
      # █░▀░█ █▄█ ▀▄▀ ██▄
      bind = SUPER SHIFT, left, movewindow, l
      bind = SUPER SHIFT, right, movewindow, r
      bind = SUPER SHIFT, up, movewindow, u
      bind = SUPER SHIFT, down, movewindow, d

      # █▀█ █▀▀ █▀ █ ▀█ █▀▀
      # █▀▄ ██▄ ▄█ █ █▄ ██▄
      bind = SUPER CTRL, left, resizeactive, -20 0
      bind = SUPER CTRL, right, resizeactive, 20 0
      bind = SUPER CTRL, up, resizeactive, 0 -20
      bind = SUPER CTRL, down, resizeactive, 0 20

      # ▀█▀ ▄▀█ █▄▄ █▄▄ █▀▀ █▀▄
      # ░█░ █▀█ █▄█ █▄█ ██▄ █▄▀
      bind= SUPER, g, togglegroup,
      bind= SUPER, tab, changegroupactive,

      # █▀ █▀█ █▀▀ █▀▀ █ ▄▀█ █░░
      # ▄█ █▀▀ ██▄ █▄▄ █ █▀█ █▄▄
      bind = SUPER, grave, togglespecialworkspace,
      bind = SUPERSHIFT, grave, movetoworkspace, special

      # █▀ █░█░█ █ ▀█▀ █▀▀ █░█
      # ▄█ ▀▄▀▄▀ █ ░█░ █▄▄ █▀█
      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER ALT, up, workspace, e+1
      bind = SUPER ALT, down, workspace, e-1

      # █▀▄▀█ █▀█ █░█ █▀▀
      # █░▀░█ █▄█ ▀▄▀ ██▄
      bind = SUPER SHIFT, 1, movetoworkspace, 1
      bind = SUPER SHIFT, 2, movetoworkspace, 2
      bind = SUPER SHIFT, 3, movetoworkspace, 3
      bind = SUPER SHIFT, 4, movetoworkspace, 4
      bind = SUPER SHIFT, 5, movetoworkspace, 5
      bind = SUPER SHIFT, 6, movetoworkspace, 6
      bind = SUPER SHIFT, 7, movetoworkspace, 7
      bind = SUPER SHIFT, 8, movetoworkspace, 8

      # █▀▄▀█ █▀█ █░█ █▀ █▀▀   █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀
      # █░▀░█ █▄█ █▄█ ▄█ ██▄   █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow
      bind = SUPER, mouse_down, workspace, e+1
      bind = SUPER, mouse_up, workspace, e-1

      # scratchpad pyprland
      # bind = SUPER, Z, exec, pypr toggle term && hyprctl dispatch bringactivetotop
      # bind = SUPER SHIFT, F, exec, pypr toggle ranger && hyprctl dispatch bringactivetotop
      # #bind = SUPER, N, exec, pypr toggle musikcube && hyprctl dispatch bringactivetotop
      # #bind = SUPER, B, exec, pypr toggle btm && hyprctl dispatch bringactivetotop
      # #bind = SUPER, E, exec, pypr toggle geary && hyprctl dispatch bringactivetotop
      # #bind = SUPER, code:172, exec, pypr toggle pavucontrol && hyprctl dispatch bringactivetotop
      # $scratchpadsize = size 80% 85%

    '';
  };

  services.udiskie = {
    enable = true;
    tray = "always";
  };

  # Hyprpaper configuration file
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper/hyprpaper.conf;

  # home.file.".config/hypr/pyprland.json".text = ''
  #   {
  #     "pyprland": {
  #       "plugins": ["scratchpads", "magnify"]
  #     },
  #     "scratchpads": {
  #       "term": {
  #         "command": "alacritty --class scratchpad",
  #         "margin": 50
  #       },
  #       "ranger": {
  #         "command": "kitty --class scratchpad -e ranger",
  #         "margin": 50
  #       },
  #       "btm": {
  #         "command": "alacritty --class scratchpad -e btm",
  #         "margin": 50
  #       },
  #       "pavucontrol": {
  #         "command": "pavucontrol",
  #         "margin": 50,
  #         "unfocus": "hide",
  #         "animation": "fromTop"
  #       }
  #     }
  #   }
  # '';

  home.packages = with pkgs; [
    libsForQt5.qt5.qtwayland
    libsForQt5.filelight
    cinnamon.nemo-with-extensions
    cool-retro-term
    copyq
    ffmpegthumbnailer
    grimblast
    gsettings-desktop-schemas
    hyprpaper
    hyprpicker
    killall
    lxqt.lxqt-policykit
    networkmanagerapplet
    pamixer
    pavucontrol
    qt6.qtwayland
    shotman
    slurp
    sov
    squeekboard #virtual keyboard
    swayidle
    wf-recorder
    wl-clipboard
    wlogout
    wlr-randr
    wlsunset
    wofi-emoji
    wtype
    wtype
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
  ];
}
