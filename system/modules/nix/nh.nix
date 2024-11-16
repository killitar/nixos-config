{...}: {
  # nh default flake
  environment.variables.FLAKE = "/home/killitar/nix";

  programs.nh = {
    enable = true;
    # weekly cleanup
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
