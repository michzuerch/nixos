{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
        font-family: 'Fira Code', 'Symbols Nerd Font Mono';
        font-size: 16px;
        font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        min-height: 45px;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces button {
        color: #b4befe;
      }

      #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery {
        border-radius: 10px;
        color: #cdd6f4;
        padding-left: 10px;
        padding-right: 10px;
        margin-right: 15px;
      }

    '';
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/weather"
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
          "memory"
          "cpu"
          "network"
          "bluetooth"
          "battery"
          "tray"
          "custom/powermenu"
          "clock"
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
          format-icons = [ "󰃟" ];
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
      }
    ];
  };

  home.packages = with pkgs; [
    blueberry
    brightnessctl
    pamixer
    pavucontrol
    wttrbar
  ];
}
