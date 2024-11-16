{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    config.common = {
      default = "gtk";
      "org.freedesktop.impl.portal.Screencast" = "hyprland";
      "org.freedesktop.impl.portal.Screenshot" = "hyprland";
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
