{pkgs, ...}: {
  imports = [./btop.nix ./bat.nix ./fzf.nix ./eza.nix ./zoxide.nix ./lazygit.nix ./ripgrep.nix ./direnv.nix ./fastfetch.nix];

  home.packages = with pkgs; [killall unzip];
}
