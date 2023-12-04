{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    style = ''
             * {
               font-family: "JetBrainsMono Nerd Font";
               font-size: 12pt;
               font-weight: bold;
               border-radius: 8px;
               transition-property: background-color;
               transition-duration: 0.5s;
             }
             @keyframes blink_red {
               to {
                 background-color: rgb(242, 143, 173);
                 color: rgb(26, 24, 38);
               }
             }
             .warning, .critical, .urgent {
               animation-name: blink_red;
               animation-duration: 1s;
               animation-timing-function: linear;
               animation-iteration-count: infinite;
               animation-direction: alternate;
             }
             window#waybar {
               background-color: transparent;
             }
             window > box {
               margin-left: 5px;
               margin-right: 5px;
               margin-top: 5px;
               background-color: #1e1e2a;
               padding: 3px;
               padding-left:8px;
               border: 2px none #33ccff;
             }
       #workspaces {
               padding-left: 0px;
               padding-right: 4px;
             }
       #workspaces button {
               padding-top: 5px;
               padding-bottom: 5px;
               padding-left: 6px;
               padding-right: 6px;
             }
       #workspaces button.active {
               background-color: rgb(181, 232, 224);
               color: rgb(26, 24, 38);
             }
       #workspaces button.urgent {
               color: rgb(26, 24, 38);
             }
       #workspaces button:hover {
               background-color: rgb(248, 189, 150);
               color: rgb(26, 24, 38);
             }
             tooltip {
               background: rgb(48, 45, 65);
             }
             tooltip label {
               color: rgb(217, 224, 238);
             }
       #custom-launcher {
               font-size: 20px;
               padding-left: 8px;
               padding-right: 6px;
               color: #7ebae4;
             }
       #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu {
               padding-left: 10px;
               padding-right: 10px;
             }
       #memory {
               color: rgb(181, 232, 224);
             }
       #cpu {
               color: rgb(245, 194, 231);
             }
       #clock {
               color: rgb(217, 224, 238);
             }
      /* #idle_inhibitor {
               color: rgb(221, 182, 242);
             }*/
       #custom-wall {
               color: #33ccff;
          }
       #temperature {
               color: rgb(150, 205, 251);
             }
       #backlight {
               color: rgb(248, 189, 150);
             }
       #pulseaudio {
               color: rgb(245, 224, 220);
             }
       #network {
               color: #ABE9B3;
             }
       #network.disconnected {
               color: rgb(255, 255, 255);
             }
       #custom-powermenu {
               color: rgb(242, 143, 173);
               padding-right: 8px;
             }
       #tray {
               padding-right: 8px;
               padding-left: 10px;
             }
        #custom-notification {
          background-color: transparent;
          color: #a1a19a;
          padding: 1px 8px;
          margin-top: 5px;
          margin-bottom: 5px;
          margin-left: 2px;
          margin-right: 2px;
          border-radius: 20px;
          transition: all 0.3s ease;
        }

    '';
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "custom/launcher"
          "temperature"
	  "hyprland/workspaces"
	  "hyprland/submap"
	  "custom/notification"
        ];
        modules-center = [
          "clock"
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
          "custom/powermenu"
          "tray"
        ];
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "wofi --show drun";
          "tooltip" = false;
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = ["" "" ""];
          };
          "on-click" = "pavucontrol";
	  "on-click-right" = "pamixer -t";
          "tooltip" = false;
        };
        "hyprland/workspaces" = {
          "format" = " {icon} ";
          "format-icons" = {
            "default" = "󰄰";
            "active" = "";
          };
          "on-click" = "activate";
        };
        "hyprland/submap" = {
          "format" = "{}";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%H:%M }";
	  "locale" = "de_DE.UTF-8";
	  "timezone" = "Europe/Busingen";
	  "format-alt" = " {:%A, %d %B} ";
          "tooltip" = true;
          "tooltip-format" = "{calendar}";
	  "calendar" = {
             "mode" = "year";
	     "mode-mon-col" = 3;
	     "format" = {
               "today" = "<span color='yellow'>{}</span>";
	     };
	  };
        };
        "battery" = {
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "format" = " {icon} {capacity} ";
          "format-charging" = " 󰂄 {capacity} ";
          "format-plugged" = " 󱘖 {capacity} ";
          "format-icons" = [
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
          "on-click" = "";
          "tooltip" = false;
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
        };
        "backlight" = {
          "format" = " {icon} {percent} ";
          "format-icons" = [ "󰃟" ];
          "on-scroll-up" = "brightnessctl set +1%";
          "on-scroll-down" = "brightnessctl set 1%-";
          "on-click" = "brightnessctl set 0";
          "tooltip" = false;
        };
        "bluetooth" = {
          "format-disabled" = "   ";
          "format-off" = "   ";
          "format-on" = " 󰂯 ";
          "format-connected" = " 󰂯 ";
          "format-connected-battery" = " 󰂯 ";
          "tooltip-format-connected" = " {device_alias} 󰂄{device_battery_percentage} ";
          "on-click" = "blueberry";
          "tooltip" = true;
        };
        "network" = {
          "format-disconnected" = "󰯡 Disconnected";
          "format-ethernet" = "󰒢 Connected!";
          "format-linked" = "󰖪 {essid} (No IP)";
          "format-wifi" = "󰖩 {essid}";
          "interval" = 1;
          "tooltip" = false;
        };
        "custom/powermenu" = {
          "format" = "";
          "on-click" = "wlogout";
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
      }
    ];
  };

  home.packages = with pkgs; [
    blueberry
    brightnessctl
    kitty
    pamixer
    pavucontrol
  ];
}
