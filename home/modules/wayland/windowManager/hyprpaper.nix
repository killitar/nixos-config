{pkgs, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";

      preload = ["~/nix/assets/walls/001.jpg"];

      wallpaper = [
        ", ~/nix/assets/walls/001.jpg"
      ];
    };
  };
}
