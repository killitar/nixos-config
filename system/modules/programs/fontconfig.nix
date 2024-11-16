{pkgs, ...}: {
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["IosevkaTerm Nerd Font"];
        serif = ["Noto Serif"];
        sansSerif = ["Inter"];
      };
    };
    packages = with pkgs; [
      roboto
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      (google-fonts.override {fonts = ["Inter"];})
      (nerdfonts.override {fonts = ["IosevkaTerm" "JetBrainsMono"];})
    ];
  };
}
