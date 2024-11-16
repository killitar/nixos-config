{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: let
  brillo = lib.getExe pkgs.brillo;
  hyprlockExe = lib.getExe config.programs.hyprlock.package;
in {
  services.hypridle = {
    enable = true;

    settings = {
      listener = [
        {
          timeout = 150; # 2.5min.
          on-timeout = "${brillo} -O; ${brillo} -u 1000000 -S 10";
          on-resume = "${brillo} -I -u 500000";
        }
        {
          timeout = 150; # 2.5min.
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
          on-resume = "brightnessctl -rd rgb:kbd_backlight";
        }
        {
          timeout = 300; # 5 min.
          on-timeout = "hyprlock";
          on-resume = "";
        }
        {
          timeout = 330; # 5.5min.
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800; # 30 min.
          on-timeout = "systemctl suspend";
          on-resume = "";
        }
      ];

      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = hyprlockExe;
        unlock_cmd = "";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
    };
  };

  systemd.user.services.hypridle = {
    Service.Slice = "session.slice";
    Unit.After = lib.mkForce [];
    Unit.PartOf = lib.mkForce ["hyprland-session.target"];
    Install.WantedBy = lib.mkForce ["hyprland-session.target"];
  };
}
