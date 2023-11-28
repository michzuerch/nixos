{ pkgs, ... }: {
  wayland.windowManager.sway = {
  enable = true;
  config = {
    seat = {
      "*" = {
        hide_cursor = "when-typing enable";
        xcursor_theme = "Adwaita 24";
        };
    };
    window.titlebar = false;
    floating.titlebar = false;
    window.border = 3;
    floating.border = 3;
    focus.followMouse = "no";
    focus.wrapping = "yes";
    startup = [
      { command = "waybar";}
      { command = "gammastep";}
      { command = "nm-applet";}
      { command = "autotiling"; always = true;}
      { command = "wl-paste --type text --watch cliphist store"; always = true;}
      { command = "wl-paste --type image --watch cliphist store"; always = true;}
    ];
    gaps.outer = 0;
    gaps.inner = 8;
    gaps.smartBorders = "no_gaps";
    gaps.smartGaps = true;
    terminal = "alacritty";
    up = "j";
    down = "k";
    left = "l";
    right = "h";
    keybindings = {
      "Mod1+Shift+c" = "kill";
      "Mod1+Shift+r" = "reload";
      "Mod1+Shift+space" = "floating toggle";
      "Mod1+a" = "focus parent";
      "Mod1+b" = "splith";
      "Mod1+e" = "layout toggle split";
      "Mod1+f" = "fullscreen";
      "Mod1+h" = "focus left";
      "Mod1+j" = "focus down";
      "Mod1+k" = "focus up";
      "Mod1+l" = "focus right";
      "Mod1+r" = ''mode "resize"'';
      "Mod1+s" = "layout stacking";
      "Mod1+space" = "focus mode_toggle";
      "Mod1+v" = "splitv";
      "Mod1+w" = "layout tabbed";
      "Mod4+Shift+a" = "exec apostrophe";
      "Mod4+Shift+e" = "exec org.nickvision.tagger";
      "Mod4+Shift+f" = "exec foliate";
      "Mod4+Shift+g" = "exec gthumb /home/michzuerch/Pictures/";
      "Mod4+Shift+s" = "exec stellarium";
      "Mod4+b" = "exec firefox";
      "Mod4+f" = "exec freetube";
      "Mod4+g" = "exec gimp";
      "Mod4+h" = "exec kitty -e gtop";
      "Mod4+k" = "exec keepassxc /home/ajilemondrop/Documents/passwords.kdbx";
      "Mod4+m" = "exec mscore";
      "Mod4+r" = "exec kitty -e ranger";
      "Mod4+s" = "exec signal-desktop";
      "Mod4+t" = "exec alacritty";
      "Mod4+z" = "exec zoom";
      "Print" = "exec grim /home/michzuerch/Pictures/screenshots/$(date +'%Y-%m-%d-%H-%M-%S-screenshot.png')";
      "XF86AudioLowerVolume" = "exec pamixer -d 5";
      "XF86AudioMute" = "exec pamixer --toggle-mute";
      "XF86AudioRaiseVolume" = "exec pamixer -i 5";
      "XF86Calculator" = "exec galculator";
      "XF86MonBrightnessDown" = "exec brightnessctl s 2%-";
      "XF86MonBrightnessUp" = "exec brightnessctl s +2%";
       };
      keycodebindings = {
        "Mod1+10" = "workspace number 1";
        "Mod1+11" = "workspace number 2";
        "Mod1+12" = "workspace number 3";
        "Mod1+13" = "workspace number 4";
        "Mod1+14" = "workspace number 5";
        "Mod1+15" = "workspace number 6";
        "Mod1+16" = "workspace number 7";
        "Mod1+17" = "workspace number 8";
        "Mod1+18" = "workspace number 9";
        "Mod1+Shift+10" = "move container to workspace number 1";
        "Mod1+Shift+11" = "move container to workspace number 2";
        "Mod1+Shift+12" = "move container to workspace number 3";
        "Mod1+Shift+13" = "move container to workspace number 4";
        "Mod1+Shift+14" = "move container to workspace number 5";
        "Mod1+Shift+15" = "move container to workspace number 6";
        "Mod1+Shift+16" = "move container to workspace number 7";
        "Mod1+Shift+17" = "move container to workspace number 8";
        "Mod1+Shift+18" = "move container to workspace number 9";
      };
      modifier = "Mod1";
      floating.modifier = "Mod1";
      fonts = {
        names = [ "Mononoki Nerd Font" ];
        style = "Regular";
        size = 12.0;
      };
      colors = {
        background = "#f8f8f2";
        focused = {
          border = "#bd93f9";
          background = "#282a36";
          text = "#f8f8f2";
          indicator = "#bd93f9";
          childBorder = "#bd93f9";
        };
        focusedInactive = {
          border = "#282a36";
          background = "#282a36";
          text = "#f8f8f2";
          indicator = "#282a36";
          childBorder = "#282a36";
        };
        placeholder = {
          border = "#282a36";
          background = "#282a36";
          text = "#f8f8f2";
          indicator = "#282a36";
          childBorder = "#282a36";
        };
        unfocused = {
          border = "#282a36";
          background = "#282a36";
          text = "#f8f8f2";
          indicator = "#282a36";
          childBorder = "#282a36";
        };
        urgent = {
          border = "#ff5555";
          background = "#ff5555";
          text = "#f8f8f2";
          indicator = "#ff5555";
          childBorder = "#ff5555";
        };
      };
      bars = [];
    };    
    extraConfig = ''
input "type:touchpad" {
  dwt enabled
  tap enabled
  middle_emulation enabled
}
input * {  
  xkb_layout "us"
}
bindswitch --reload --locked lid:on exec swaylock -f
output * {
  background /home/michzuerch/wallpapers/dracula-tree-wallpaper.png fill
}
for_window [title="File Operation Progress"] floating enable
for_window [title="galculator"] floating enable
for_window [title="Volume Control"] floating enable'';
    wrapperFeatures.gtk = true;
  };

  home.packages = with pkgs; [
    autotiling
    gammastep
  ];
}
