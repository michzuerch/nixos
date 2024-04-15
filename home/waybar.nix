{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    style = ''
      @define-color rosewater #f2d5cf;
      @define-color flamingo #eebebe;
      @define-color pink #f4b8e4;
      @define-color mauve #ca9ee6;
      @define-color red #e78284;
      @define-color maroon #ea999c;
      @define-color peach #ef9f76;
      @define-color yellow #e5c890;
      @define-color green #a6d189;
      @define-color teal #81c8be;
      @define-color sky #99d1db;
      @define-color sapphire #85c1dc;
      @define-color blue #8caaee;
      @define-color lavender #babbf1;
      @define-color text #c6d0f5;
      @define-color subtext1 #b5bfe2;
      @define-color subtext0 #a5adce;
      @define-color overlay2 #949cbb;
      @define-color overlay1 #838ba7;
      @define-color overlay0 #737994;
      @define-color surface2 #626880;
      @define-color surface1 #51576d;
      @define-color surface0 #414559;
      @define-color base #303446;
      @define-color mantle #292c3c;
      @define-color crust #232634;


      * {
        border: none;
        font-family: 'Fira Code', 'Symbols Nerd Font Mono';
        font-size: 16px;
      }

      window#waybar {
        background-color: alpha(@base, 0.7);
        border-top: solid alpha(@surface1, 0.7) 2;
        border-radius: 8px;
        color: @crust;
        transition-property: background-color;
        transition-duration: .2s;
      }

      button {
        border: none;
      }

      button:hover {
        background: inherit;
      }

      #workspaces button {
        padding: 0 2px;
        color: @rosewater;
      }

      #window, #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery, #idle_inhibitor, #custom-weather, #custom-powermenu {
        border-radius: 10px;
        color: @text;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 15px;
      }

    '';
    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        height = 35;
        margin = "7 7 3 7";
        spacing = 2;
        modules-left = [
          # "custom/weather"
          "idle_inhibitor"
          "hyprland/workspaces"
          "custom/notification"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "pulseaudio"
          "backlight"
          # "memory"
          # "cpu"
          "network"
          "bluetooth"
          "battery"
          "tray"
          "custom/weather"
          "clock"
          "custom/powermenu"
        ];
        pulseaudio = {
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = "󰖁 Muted";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
          on-click-right = "pamixer -t";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "󰄰";
            active = "";
          };
          on-click = "activate";
        };
        clock = {
          interval = 1;
          format = "{:%H:%M }";
          locale = "de_DE.UTF-8";
          timezone = "Europe/Busingen";
          format-alt = " {:%A, %d %B} ";
          tooltip = true;
          tooltip-format = "{calendar}";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            format = {
              today = "<span color='yellow'>{}</span>";
            };
          };
        };
        battery = {
          states = {
            warning = 20;
            critical = 10;
          };
          format = " {icon} {capacity} ";
          format-charging = " 󰂄 {capacity} ";
          format-plugged = " 󱘖 {capacity} ";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };
        memory = {
          interval = 1;
          format = "󰻠 {percentage}%";
          states = {
            warning = 85;
          };
        };
        cpu = {
          interval = 1;
          format = "󰍛 {usage}%";
        };
        backlight = {
          format = " {icon} {percent} ";
          format-icons = ["󰃟"];
          on-scroll-up = "brightnessctl set +10%";
          on-scroll-down = "brightnessctl set 10%-";
          on-click = "brightnessctl set 0";
          tooltip = false;
        };
        bluetooth = {
          format-disabled = "   ";
          format-off = "   ";
          format-on = " 󰂯 ";
          format-connected = " 󰂯 ";
          format-connected-battery = " 󰂯 ";
          tooltip-format-connected = " {device_alias} 󰂄{device_battery_percentage} ";
          on-click = "blueberry";
          tooltip = true;
        };
        network = {
          format-disconnected = "󰯡 Disconnected";
          format-ethernet = "󰒢 Connected!";
          format-linked = "󰖪 {essid} (No IP)";
          format-wifi = "󰖩 {essid}";
          interval = 1;
          tooltip = true;
          format-alt = "󰅢 {bandwidthDownBytes} /  {bandwidthUpBytes} ";
        };
        "custom/powermenu" = {
          format = "";
          on-click = "wlogout";
          tooltip = false;
        };
        "custom/weather" = {
          format = "{} °";
          tooltip = true;
          interval = 3600;
          exec = "wttrbar --location Radolfzell";
          "return-type" = "json";
        };
        idle_inhibitor = {
          format = "{icon}";
          "format-icons" = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
          tooltip = false;
        };
        tray = {
          icon-size = 15;
          spacing = 5;
        };
      };
    };
  };

  home.packages = with pkgs; [
    blueberry
    brightnessctl
    pamixer
    pavucontrol
    wttrbar
  ];
}
