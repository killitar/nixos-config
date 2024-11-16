{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      gnumake
      gcc
    ];
  };
  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
}
