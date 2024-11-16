{
  config,
  pkgs,
  ...
}: let
  terminal = config.home.sessionVariables.TERMINAL;
  screenshotarea = "grimblast --notify --freeze copy area";
  screenshotscrean = "grimblast --notify --freeze copy output";
  cliphist = "cliphist list | rofi -dmenu | cliphist decode | wl-copy";
  launcher = "rofi -show drun || pkill rofi";

  workspaces = builtins.concatLists (builtins.genList (x: let
      ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
    in [
      "SUPER, ${ws}, workspace, ${toString (x + 1)}"
      "SUPERSHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
    ])
    6);
in {
  wayland.windowManager.hyprland = {
    settings = {
      bind =
        [
          "SUPERSHIFT, C, killactive"
          "SUPER, F, fullscreen"
          "SUPER, Space, togglefloating"

          # Terminal
          "SUPER, Return, exec, ${terminal}"

          # Launchers
          "SUPER, D, exec, ${launcher}"

          "SUPER, Escape, exec, pidof hyprlock || hyprlock"

          # Screenshot
          ",Print, exec, ${screenshotarea}"
          "SUPERSHIFT, R, exec, ${screenshotarea}"

          # current screen
          "CTRL, Print, exec, ${screenshotscrean}"
          "SUPERSHIFT CTRL, R, exec, ${screenshotscrean}"

          # Cliphist
          "SUPER, C, exec, ${cliphist}"

          # switch focus
          "SUPER, left, movefocus, l"
          "SUPER, right, movefocus, r"
          "SUPER, up, movefocus, u"
          "SUPER, down, movefocus, d"
          "SUPER, h, movefocus, l"
          "SUPER, j, movefocus, d"
          "SUPER, k, movefocus, u"
          "SUPER, l, movefocus, r"

          # window control
          "SUPERSHIFT, left, movewindow, l"
          "SUPERSHIFT, right, movewindow, r"
          "SUPERSHIFT, up, movewindow, u"
          "SUPERSHIFT, down, movewindow, d"
          "SUPERSHIFT, h, movewindow, l"
          "SUPERSHIFT, j, movewindow, d"
          "SUPERSHIFT, k, movewindow, u"
          "SUPERSHIFT, l, movewindow, r"

          # Cycle through workspaces
          "SUPERALT, up, workspace, m-1"
          "SUPERALT, down, workspace, m+1"

          # Volume and Media Control
          ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
          ", XF86AudioLowerVolume, exec, pamixer -d 5 "
          ", XF86AudioMute, exec, pamixer -t"
          ", XF86AudioMicMute, exec, pamixer --default-source -t"
          ", XF86AudioPlay,exec, playerctl play-pause"
          ", XF86AudioNext,exec, playerctl next"
          ", XF86AudioPrev,exec, playerctl previous"
          ", XF86AudioStop,exec, playerctl stop"

          # Brightness control
          ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5 "
          ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5 "
        ]
        ++ workspaces;

      bindm = ["SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow"];
    };
  };
}
