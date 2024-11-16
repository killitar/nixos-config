{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [libva intel-media-driver libvdpau-va-gl];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        libvdpau-va-gl
      ];
    };
  };
  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
}
