{
  config,
  pkgs,
  ...
}: {
  home = {
    pointerCursor = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 25;
      gtk.enable = true;
      x11.enable = true;
    };
    sessionVariables = {
      XCURSOR_SIZE = config.home.pointerCursor.size;
      XCURSOR_THEME = config.home.pointerCursor.name;
    };
  };
}
