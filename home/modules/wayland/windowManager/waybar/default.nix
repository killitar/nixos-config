{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "graphical-session.target";
    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        reload-style-on-chage = true;
        spacing = 0;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "pulseaudio"
          "battery"
          "network"
          "custom/bluetooth"
          "hyprland/language"
          "custom/notification"
          "custom/power"
        ];

        # Workspaces
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          disable-scroll = true;
          all-outputs = true;
          show-special = true;
          persistent-workspaces = {"*" = 5;};
        };

        # Clock & Calendar

        clock = {
          calendar = {
            format = {today = "<span color='#98971A'><b>{}</b></span>";};
          };
          format = "  {:%H:%M}";
          tooltip = "true";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "  {:%d/%m}";
        };

        # Tray
        tray = {
          icon-size = 14;
          show-passive-items = true;
          spacing = 4;
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "US";
          format-ru = "RU";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          tooltip = true;
          tooltip-format = "{time}";
          format = "{icon} {capacity}% ";
          format-icons = [
            "󰁺"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
          ];
          format-charging = "  {capacity}%";
          format-plugged = " {capacity}% ";
          format-warning = "󰂃 {capacity}% ";
          format-critical = "󰂃 {capacity}% ";
          format-time = "{H}h{M}m";
        };

        network = {
          format-wifi = "  ";
          format-ethernet = " ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "  ";
          tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        };

        "custom/bluetooth" = {
          format = "<span color=\"#89b4fa\">󰂯  </span>";
          interval = 3;
          rotate = 0;
          on-click = "blueman-manager";
          tooltip = false;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon} ";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>  <span foreground='#CC241D'></span>";
            none = "  <span foreground='#CC241D'></span>";
            dnd-notification = "<span foreground='red'><sup></sup></span>  <span foreground='#CC241D'></span>";
            dnd-none = "  <span foreground='#CC241D'></span>";
            inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='#CC241D'></span>";
            inhibited-none = "  <span foreground='#CC241D'></span>";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>  <span foreground='#CC241D'></span>";
            dnd-inhibited-none = "  <span foreground='#CC241D'></span>";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        # Pulseaudio
        pulseaudio = {
          format = "{volume} {icon} / {format_source}";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          format-muted = "󰖁 / {format_source}";
          format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          on-scroll-up = "${pkgs.pamixer}/bin/pamixer --decrease 1";
          on-scroll-down = "${pkgs.pamixer}/bin/pamixer --increase 1";
          tooltip = false;
        };
      }
    ];

    style = builtins.readFile (./. + "/style.css");
  };
}
