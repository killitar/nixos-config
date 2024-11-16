{
  pkgs,
  lib,
  user,
  ...
}: {
  security.pam.services.greetd = {enableGnomeKeyring = true;};
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = builtins.concatStringsSep " " [
          "${pkgs.greetd.tuigreet}/bin/tuigreet"
          "--asterisks"
          "--remember"
          "--time"
          "--cmd Hyprland"
        ];
        user = user;
      };
    };
  };
}
