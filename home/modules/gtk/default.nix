{
  pkgs,
  config,
  ...
}: {
  imports = [./cursor.nix];
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        size = "compact";
        tweaks = ["rimless" "normal"];
        variant = "mocha";
      };
    };
    font = {
      name = "Inter";
      package = pkgs.google-fonts.override {fonts = ["Inter"];};
      size = 10;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-error-bell = 0;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-error-bell = 0;
    };
  };

  qt = {
    enable = true;
    style = {
      name = "catppuccin-kvantum";
      package = pkgs.catppuccin-kvantum;
    };
    platformTheme.name = "gtk3";
  };
}
