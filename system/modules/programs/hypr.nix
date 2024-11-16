{...}: {
  environment.sessionVariables = {
    NIXOS_OZON_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };
}
