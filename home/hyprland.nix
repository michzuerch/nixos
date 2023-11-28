{ pkgs, ... }: {
  systemd.user.sessionVariables = {
    GDK_BACKEND="wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    NIXOS_OZONE_WL = 1;
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    _JAVA_AWT_WM_NONREPARENTING = 1;
  };

wayland.windowManager.hyprland = {
    enable = true;
    xwayland = { enable = true; };
    systemd.enable = true;
    plugins = [ ];
    settings = { };
    extraConfig = ''
       $w1 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/5.jpg"
       $w2 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/6.jpg"
       $w3 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/7.jpg"
       $w4 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/8.jpg"
       $w5 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/5.jpg"
       $w6 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/6.jpg"
       $w7 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/7.jpg"
       $w8 = hyprctl hyprpaper wallpaper "eDP-1,~/nixos/wallpaper/8.jpg"

       # █▀▀ ▀▄▀ █▀▀ █▀▀
       # ██▄ █░█ ██▄ █▄▄
       exec-once = hyprpaper & waybar # & ags
       exec-once = sleep 4 && gnome-keyring-daemon --start --components=secrets
       exec-once = sleep 6 && dbus-update-activation-environment --all
       exec-once = sleep 2 && copyq --start-server
       exec-once = lxqt-policykit-agent & udiskie &
       exec-once = sleep 8 && poweralertd
       exec-once = blueman-applet
       exec-once = nm-applet --indicator
       
       ############################################# misc #############################################
       # █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
       # █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄
       monitor=,preferred,auto,1

       # █ █▄░█ █▀█ █░█ ▀█▀
       # █ █░▀█ █▀▀ █▄█ ░█░
       input {
         kb_layout = us
         follow_mouse = 1
         sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
       }

       # █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ █░░
       # █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ █▄▄
       general {
         gaps_in=5
         gaps_out=5
         border_size=0
         no_border_on_floating = true
         layout = dwindle
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
           size = 3
           passes = 3
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

       master {
           new_is_master = true
       }

       gestures {
           workspace_swipe = off
       }

       # █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄
       # █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀
       bind = SUPER, P, exec, wlogout
       bind = SUPER SHIFT, X, exec, hyprpicker -a -n
       bind = CTRL ALT, L, exec, swaylock
       bind = SUPER, Return, exec, alacritty
       bind = SUPER SHIFT, Return, exec, cool-retro-term
       bind = SUPER, E, exec, nemo
       bind = SUPER, R, exec, wofi --show drun 
       #bind = SUPER, period, exec, killall rofi || rofi -show emoji -emoji-format "{emoji}" -modi emoji -theme ~/.config/rofi/global/emoji
       bind = SUPER, escape, exec, wlogout --protocol layer-shell -b 5 -T 400 -B 400

       bind = SUPER, X, exec, dunstctl history-pop
       bind = SUPER, L, exec, swaylock
       bind = SUPER, M, exec, wlogout --protocol layer-shell
       bind = SUPER SHIFT, M, exit,
       bind = SUPER, K, exec, lite-xl
       bind = ,Print, exec, shotman --capture output

       # █▀▄▀█ █░█ █░░ ▀█▀ █ █▀▄▀█ █▀▀ █▀▄ █ ▄▀█
       # █░▀░█ █▄█ █▄▄ ░█░ █ █░▀░█ ██▄ █▄▀ █ █▀█
       binde=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
       binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
       binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

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
       bind = SUPER, 9, workspace, 9
       bind = SUPER, 0, workspace, 10
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
       bind = SUPER SHIFT, 9, movetoworkspace, 9
       bind = SUPER SHIFT, 0, movetoworkspace, 10

       # █▀▄▀█ █▀█ █░█ █▀ █▀▀   █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀
       # █░▀░█ █▄█ █▄█ ▄█ ██▄   █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█
       bindm = SUPER, mouse:272, movewindow
       bindm = SUPER, mouse:273, resizewindow
       bind = SUPER, mouse_down, workspace, e+1
       bind = SUPER, mouse_up, workspace, e-1

    '';
  };


  home.packages = with pkgs; [
    cool-retro-term
    grimblast
    hyprpicker
    lxqt.lxqt-policykit
    pamixer
    pavucontrol
    shotman
    swayidle
    swaylock-effects
    wf-recorder
    wl-clipboard
    wlogout
  ];
}
