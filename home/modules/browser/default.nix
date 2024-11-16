{
  pkgs,
  inputs,
  ...
}: {
  # programs.firefox = {
  #   enable = true;
  # };
  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
