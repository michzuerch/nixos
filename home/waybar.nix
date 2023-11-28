{ pkgs, ...}: {
  programs.waybar = {
    enable = true;
  };

  home.file.".config/waybar/config.jsonc" = {
    text = ''
      {
        "layer": "top",
        "position": "top",
	"mod": "dock",
	"exclusive": true,
        "height": 36,
        "margin-top": 10,
        "margin-bottom": 0,
        "margin-left": 10,
        "margin-right": 10,
        "spacing": 10,
        "gtk-layer-shell": true,
        "border-radius": 10,

        "clock": {
          "interval": 1,
          "format": " {:%I:%M} ",
	  "locale": "de_DE.UTF-8",
	  "timezone": "Europe/Busingen",
          "format-alt": " {:%A, %d %B} ",
          // "on-click": "gnome-calendar",
          "tooltip": true,
          "tooltip-format": "{calendar}",
          "calendar": {
            "mode": "year",
            "mode-mon-col": 3,
            "format": {
              "today": "<span color='white'>{}</span>"
            }
          }
        },
        "modules-left": [
          "clock",
          "hyprland/workspaces",
          "custom/notification"
        ],
        "modules-center": [
          "hyprland/submap",
          "hyprland/window"
        ],
        "modules-right": [
          "cpu",
          "memory",
          // "network#wlp5s0",
          "bluetooth",
          "backlight",
          // "pulseaudio#microphone",
          "pulseaudio#audio",
          "battery",
          "tray"
        ],

        "hyprland/workspaces": {
          "format": " {icon} ",
          "format-icons": {
            "default": "󰄰",
            "active": ""
          },
          "on-click": "activate"
        },

        "hyprland/submap": {
          "format": "{}",
          "tooltip": false
        },

        "hyprland/window": {
          "format": " {} ",
          "separate-outputs": false
        },

        "tray": {
          "icon-size": 18,
          "spacing": 10
        },

        "cpu": {
	  "interval": 10,
	  "max-length": 10,
          "format": " {usage}%",
          "on-click": "kitty --start-as=fullscreen --title gtop sh -c 'gtop'",
          "tooltip": false
        },

        "memory": {
	  "interval": 30,
	  "max-length": 30,
          "format": "󰍛 {used:0.1f}GB ({percentage}%) / {total:0.1f}GB",
          "on-click": "kitty --start-as=fullsceen --title gtop sh -c 'gtop'",
          "tooltip": false
        },

        "backlight": {
          "format": " {icon} {percent} ",
          "format-icons": [
            "󰃟"
          ],
          "on-scroll-up": "brightnessctl set +1%",
          "on-scroll-down": "brightnessctl set 1%-",
          "on-click": "brightnessctl set 0",
          "tooltip": false
        },

      	"pulseaudio#audio": {
      		"format": " {icon} {volume:2} ",
      		"format-bluetooth": " {icon} {volume}%  ",
      		"format-muted": " {icon} Muted ",
      		"format-icons": {
      			"headphones": "",
      			"default": [
      				"",
      				""
      			]
      		},
      		"scroll-step": 5,
      		"on-click": "pavucontrol",
      		"on-click-right": "pamixer -t"
      	},

        "network#wlp5s0": {
          "interval": 1,
          "interface": "wlan0",
          "format-icons": [
            "󰤯",
            "󰤟",
            "󰤢",
            "󰤥",
            "󰤨"
          ],
          "format-wifi": " {icon}  ", // added multiple spaces to the right, was not aligning center correctly, still is not :(
          "format-disconnected": "󰤮",
          "on-click": "iwgtk",
          "tooltip": true,
          "tooltip-format": "󰢮 {ifname}\n󰩟 {ipaddr}/{cidr}\n{icon} {essid}\n󱑽 {signalStrength}% {signaldBm} dBm {frequency} MHz\n󰞒 {bandwidthDownBytes}\n󰞕 {bandwidthUpBytes}"
        },

        "bluetooth": {
          "format-disabled": "   ",
          "format-off": "   ",
          "format-on": " 󰂯 ",
          "format-connected": " 󰂯 ",
          "format-connected-battery": " 󰂯 ",
          "tooltip-format-connected": " {device_alias} 󰂄{device_battery_percentage} ",
          "on-click": "blueberry",
          "tooltip": true
        },

        "battery": {
          "states": {
            "warning": 20,
            "critical": 10
          },

          "format": " {icon} {capacity} ",
          "format-charging": " 󰂄 {capacity} ",
          "format-plugged": " 󱘖 {capacity} ",
          "format-icons": [
            "󰁺",
            "󰁻",
            "󰁼",
            "󰁽",
            "󰁾",
            "󰁿",
            "󰂀",
            "󰂁",
            "󰂂",
            "󰁹"
          ],
          "on-click": "",
          "tooltip": false
        }
      }
    '';
  };

  home.file.".config/waybar/style.css" = {
    text = ''
      * {
          font-size: 12px;
          font-family: "JetBrainsMono Nerd Font";
	  border: none;
          border-radius: 0;
	  min-height: 0;
      }

      window#waybar {
        background-color: transparent;
        color: #a1a19a;
        /* border-radius: 20px; */
        /* border: 1px solid #a1a19a */
      }

      tooltip {
        background: #002635;
        border: 1px solid #002635;
        border-radius: 10px;
	border-width: 2px;
	opacity: 0.8;
      }
      tooltip label {
        color: #a1a19a;
      }

      #workspaces {
        background-color: transparent;
        margin-top: 0;
        margin-bottom: 0;
      }

      #workspaces button {
        background-color: #002635;
        color: #a1a19a;
        border-radius: 10px;
        transition: all 0.3s ease;
        margin-right: 10px;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        background-color: #869696;
        color: #f08e48;
        min-width: 30px;
        transition: all 0.3s ease;
      }

      #workspaces button.focused,
      #workspaces button.active {
        background-color: #517f8d;
        color: #f08e48;
        min-width: 30px;
        transition: all 0.3s ease;
        animation: colored-gradient 10s ease infinite;
      }

      /* #workspaces button.focused:hover,
      #workspaces button.active:hover {
        background-color: #f08e48;
        transition: all 1s ease;
      } */

      #workspaces button.urgent {
        background-color: #c43060;
        color: #002635;
        transition: all 0.3s ease;
      }

      /* #workspaces button.hidden {} */

      #taskbar {
        border-radius: 8px;
        margin-top: 4px;
        margin-bottom: 4px;
        margin-left: 1px;
        margin-right: 1px;
      }

      #taskbar button {
        color: #a1a19a;
        padding: 1px 8px;
        margin-left: 1px;
        margin-right: 1px;
      }

      #taskbar button:hover {
        background: transparent;
        border: 1px solid #517f8d;
        border-radius: 8px;
        transition: all 0.3s ease;
        animation: colored-gradient 10s ease infinite;
      }

      /* #taskbar button.maximized {} */

      /* #taskbar button.minimized {} */

      #taskbar button.active {
        border: 1px solid #517f8d;
        border-radius: 8px;
        transition: all 0.3s ease;
        animation: colored-gradient 10s ease infinite;
      }

      /* #taskbar button.fullscreen {} */

      /* -------------------------------------------------------------------------------- */

      #custom-launcher,
      /* #window, */
      #submap
      #mode,
      /* #tray, */
      #cpu,
      #memory,
      #backlight,
      #window  { background-color: #002635; }
      #pulseaudio.audio { background-color: #002635; }
      #pulseaudio.microphone,
      #network { background-color: #002635; }
      #bluetooth  { background-color: #002635; }
      #battery  { background-color: #002635; }
      #clock { background-color: #002635; }
      #custom-powermenu,

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

      #submap {
        background-color: #002635;
        border: 0;
      }

      /* If workspaces is the leftmost module, omit left margin */
      /* .modules-left > widget:first-child > #workspaces, */
      .modules-left > widget:first-child > #workspaces button,
      .modules-left > widget:first-child > #taskbar button,
      .modules-left > widget:first-child > #custom-launcher,
      .modules-left > widget:first-child > #window,
      .modules-left > widget:first-child > #tray,
      .modules-left > widget:first-child > #cpu,
      .modules-left > widget:first-child > #memory,
      .modules-left > widget:first-child > #backlight,
      .modules-left > widget:first-child > #pulseaudio.audio,
      .modules-left > widget:first-child > #pulseaudio.microphone,
      .modules-left > widget:first-child > #network,
      .modules-left > widget:first-child > #bluetooth,
      .modules-left > widget:first-child > #battery,
      .modules-left > widget:first-child > #clock,
      .modules-left > widget:first-child > #custom-powermenu,
      .modules-left > widget:first-child > #custom-notification {
        margin-left: 5px;
      }

      /* If workspaces is the rightmost module, omit right margin */
      /* .modules-right > widget:last-child > #workspaces, */
      /* .modules-right > widget:last-child > #workspaces, */
      .modules-right > widget:last-child > #workspaces button,
      .modules-right > widget:last-child > #taskbar button,
      .modules-right > widget:last-child > #custom-launcher,
      .modules-right > widget:last-child > #window,
      .modules-right > widget:last-child > #tray,
      .modules-right > widget:last-child > #cpu,
      .modules-right > widget:last-child > #memory,
      .modules-right > widget:last-child > #backlight,
      .modules-right > widget:last-child > #pulseaudio.audio,
      .modules-right > widget:last-child > #pulseaudio.microphone,
      .modules-right > widget:last-child > #network,
      .modules-right > widget:last-child > #bluetooth,
      .modules-right > widget:last-child > #battery,
      .modules-right > widget:last-child > #clock,
      .modules-right > widget:last-child > #custom-powermenu,
      .modules-right > widget:last-child > #custom-notification {
        margin-right: 5px;
      }

      /* -------------------------------------------------------------------------------- */

      #tray {
        background-color: #002635;
        padding: 1px 8px;
      }
      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #c43060;
      }

    '';
  };
}
