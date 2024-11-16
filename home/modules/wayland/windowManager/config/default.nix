{
  pkgs,
  config,
  ...
}: let
  pointer = config.home.pointerCursor;
in {
  imports = [
    ./binds.nix
    ./rules.nix
  ];
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      bezier = ["md3_decel, 0.05, 0.7, 0.1, 1" "workspace,0.17, 1.17, 0.3,1"];
      animation = [
        "border, 1, 2, default"
        "fade, 1, 2, md3_decel"
        "windows, 1, 4, md3_decel, popin 60%"
        "workspaces, 1, 5, workspace, slidefadevert 8%"
      ];
    };

    decoration = {
      rounding = 3;

      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;

      # drop_shadow = false;

      blur = {
        enabled = true;
        passes = 3;
        size = 16;
      };
    };

    exec-once = [
      # "${pkgs.hyprpanel}/bin/hyprpanel"
      "hyprctl setcursor ${pointer.name} ${toString pointer.size}"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "easyeffects --gapplication-service"
      "telegram-desktop -startintray"
    ];

    env = [
      "HYPRCURSOR_THEME,${pointer.name}"
      "HYPRCURSOR_SIZE,${toString pointer.size}"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      "col.inactive_border" = "rgba(181825ee)";
      "col.active_border" = "rgba(89b4faee)";
      layout = "dwindle";
    };
    input = {
      kb_layout = "us,ru";
      kb_options = "ctrl:nocaps, grp:alt_shift_toggle";
      follow_mouse = 1;
      accel_profile = "flat";
      touchpad = {
        scroll_factor = 0.2;
        natural_scroll = "yes";
        tap-and-drag = true;
      };
    };
    misc = {
      disable_autoreload = false;
      disable_hyprland_logo = true;
      focus_on_activate = true;
      force_default_wallpaper = 0;
    };
    # touchpad gestures
    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };
    xwayland.force_zero_scaling = true;
    monitor = ["eDP-1, preferred, auto, 1.25"];
  };
}
