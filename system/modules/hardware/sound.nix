{pkgs, ...}: {
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
  };
  environment.systemPackages = with pkgs; [pamixer pavucontrol pulseaudio easyeffects rnnoise];
}
