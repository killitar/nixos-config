{...}: {
  imports = [
    ./nh.nix
  ];
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["root" "@wheel"];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
