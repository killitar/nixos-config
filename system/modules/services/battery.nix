{pkgs, ...}: {
  services.upower = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [power-profiles-daemon];
}
