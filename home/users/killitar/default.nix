{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../modules
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.hyprpanel.overlay
    ];
  };

  home = {
    packages = with pkgs; [
    ];
  };
}
