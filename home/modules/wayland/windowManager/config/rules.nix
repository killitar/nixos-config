{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    # layer rules
    layerrule = let
      toRegex = list: let
        elements = lib.concatStringsSep "|" list;
      in "^(${elements})$";

      layers = [
        "gtk-layer-shell"
        "swaync-control-center"
        "swaync-notification-window"
        "waybar"
      ];
    in ["blur, ${toRegex layers}" "ignorealpha 0.5, ${toRegex layers}"];

    # Window rules
    windowrulev2 = [
      # Xdg
      "float, class:^(xdg-desktop-portal-gtk)$"
      "size 900 500, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"

      # Steam
      "workspace 5,class:^(steam)"
      "float, class:(steam), title:(Friends List)"

      # Minecraft
      "workspace 5,class:^(org.prismlauncher.PrismLauncher)"
      "float,class:^(org.prismlauncher.PrismLauncher)"
      "size 1700 1000,class:^(org.prismlauncher.PrismLauncher)"
      "fullscreen,class:^(.*Minecraft.*)"

      # Telegram
      "float, title:^(Media viewer)$"
      "workspace 3, class:^(org.telegram.desktop)$"
      "size 900 500,title:^(Choose Files)"

      # Spotify
      "workspace 4, title:^(Spotify Free)$"

      # Firefox
      "workspace 2, class:^(firefox)$"
      "size 900 500, title:^(Save As)$"
      "dimaround, title:^(Save As)$"

      # Zen
      "workspace 2, class:^(zen-alpha)$"

      # throw sharing indicators away
      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(Zen — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      # make Firefox/Zen PiP window floating and sticky
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      # idle inhibit while watching videos
      "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
      "idleinhibit focus, class:^(zen)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(zen)$"

      # Obsidian
      "float,class:^(obsidian)"
      "size 1700 1000,class:^(obsidian)"

      # Other
      "float,class:^(via-nativia)$"
      "float,class:^(imv)$"

      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"

      # fix xwayland apps
      "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"
    ];
  };
}
