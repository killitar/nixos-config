{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./theme.nix
  ];

  programs.rofi = {
    enable = true;
    cycle = false;
    package = pkgs.rofi-wayland;
    location = "center";
    font = "IosevkaTerm Nerd Font 12";
    terminal = "${config.home.sessionVariables.TERMINAL}";
    # plugins = with pkgs; [rofimoji];
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      sidebar-mode = true;
      hide-scrollbar = true;
      display-drun = "Apps";
      display-calc = "Run";
      display-window = "Window";
      drun-display-format = "{icon} {name}";
    };
  };
}
