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
    ${pkgs.swayidle}/bin/swayidle -w timeout 90 '$config.programs.swaylock.package/bin/swaylock -f' timeout 210
  '';
in 
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
    plugins = [];
    settings = {
      exec-once = ''${startup-script}/bin/start'';
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
        col.shadow = "0x66000000";
      };
      "$mod" = "SUPER";
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  services.udiskie = {
    enable = true;
    tray = "always";
  };

  # Hyprpaper configuration file
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper/hyprpaper.conf;

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
