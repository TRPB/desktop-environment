{
  audio-control,
  output,
  ...
}:
{
  enable = true;
  style = ''
    * {
        font-size: 20px;
        font-family: Hack Nerd Font;
    }

    window#waybar {
        background: #3b4252;
        color: #eceff4;
    }

    #custom-waybar-mpris {
        font-size:  15px;
        background: #2e3440;
    }
    #custom-right-arrow-dark,
    #custom-left-arrow-dark {
        color: #2e3440;
    }
    #custom-right-arrow-light,
    #custom-left-arrow-light {
        color: #3b4252;
        background: #2e3440;
    }

    #workspaces,
    #clock.1,
    #clock.2,
    #clock.3,
    #pulseaudio,
    #memory,
    #cpu,
    #battery,
    #disk,
    #custom-media,
    #temperature,
    #tray {
        background: #2e3440;
        
    }
    #workspaces button {
        padding: 0 2px;
        color: #fdf6e3;
    }
    #workspaces button.focused {
        color: #268bd2;
    }
    #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
    }
    #workspaces button:hover {
        background: #2e3440;
        border: #2e3440;
        padding: 0 3px;
    }

    #disk {
        color: #5e81ac;
    }
    #memory {
        color: #81a1c1;
    }
    #cpu {
        color: #88c0d0;
    }
    #battery {
        color: #859900;
    }
    #pulseaudio {
        color: #8fbcbb;
    }
    #temperature {
        color: #8cc0c6;
    }

    #clock,
    #pulseaudio,
    #memory,
    #cpu,
    #battery,
    #disk {
        padding: 0 10px;
    }

  '';
  settings = [
    {
      position = "bottom";
      output = output;
      modules-left = [
        "hyprland/workspaces"
        "custom/right-arrow-dark"
        "custom/right-arrow-light"
        "custom/waybar-mpris"
        "custom/right-arrow-dark"
      ];
      modules-center = [
        "custom/left-arrow-dark"
        "clock#1"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "clock#2"
        "custom/right-arrow-dark"
        "custom/right-arrow-light"
        "clock#3"
        "custom/right-arrow-dark"
      ];
      modules-right = [
        "custom/left-arrow-dark"
        "disk"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "memory"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "cpu"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "temperature"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "pulseaudio"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
      ];
      "custom/left-arrow-dark" = {
        format = "";
        tooltip = false;
      };
      "custom/left-arrow-light" = {
        format = "";
        tooltip = false;
      };
      "custom/right-arrow-dark" = {
        format = "";
        tooltip = false;
      };
      "custom/right-arrow-light" = {
        format = "";
        tooltip = false;
      };

      sway-workspaces = {
        disable-scroll = true;
        format = "{name}";
      };
      "clock#1" = {
        format = "{:%A}";
        tooltip = false;
      };
      "clock#2" = {
        format = "{:%H:%M:%S}";
        tooltip = false;
        interval = 1;
      };
      "clock#3" = {
        format = "{:%d/%m/%Y}";
        tooltip = false;
      };
      "hyprland/workspaces" = {
        all-outputs = true;
        format = "{icon}";
        "format-icons" = {
          default = "󰔷";
          active = "󰔶";
        };
      };
      pulseaudio = {
        format = "{icon} {volume:2}%";
        format-bluetooth = "{icon}  {volume}%";
        format-muted = "MUTE";
        format-icons = {
          headphones = "";
          default = [
            ""
            ""
          ];
        };
        scroll-step = 5;
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-click-right = audio-control;
      };
      memory = {
        interval = 5;
        format = " {}%";
      };
      cpu = {
        interval = 5;
        format = " {usage:2}%";
      };
      temperature = {
        hwmon-path = "/sys/class/hwmon/hwmon2/temp2_input";
        critical-threshold = 80;
        format = "{icon} {temperatureC}°C";
        format-icons = [
          ""
          ""
          ""
        ];
      };
      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };
      disk = {
        interval = 5;
        format = "{percentage_used:2}%";
        path = "/";
      };
      tray = {
        icon-size = 20;
      };
      "custom/waybar-mpris" = {
        format = "{icon} {}";
        return-type = "json";
        max-length = 80;
        escape = true;
        exec = "waybar-mpris --position --autofocus --pause  --play ";
        on-click = "waybar-mpris --send toggle";
        on-scroll-up = "waybar-mpris --send next";
        on-scroll-down = "waybar-mpris --send prev";
      };
    }
  ];
}
