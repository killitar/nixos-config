{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  time.timeZone = "Europe/Moscow";

  # For dual boot
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  networking = {
    hostName = "io";
    networkmanager = {enable = true;};
  };

  programs.fish.enable = true;

  system = {
    copySystemConfiguration = false;
  };
}
