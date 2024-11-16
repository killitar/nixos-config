{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./config
    # ./waybar
    ./rofi
    # ./swaync
    ./ags
  ];
  home.packages = with pkgs; [
    imv
    gtk3
    dbus
    glib
    gtklock
    brillo
    cliphist
    hyprpicker
    # hyprpanel
    grimblast
    xdg-utils
    wl-clipboard
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };

  services.gammastep = {
    enable = true;
    tray = true;

    # stopgap until geoclue's wifi location is fixed
    provider = "manual";
    latitude = 55.75222;
    longitude = 37.61556;

    enableVerboseLogging = true;

    settings.general.adjustment-method = "wayland";
  };
  # hardware.brillo.enable = true;
}
