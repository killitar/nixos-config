{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs
    pnpm
    eslint_d
    eslint
    prettierd
    nodePackages_latest.prettier
  ];
}
