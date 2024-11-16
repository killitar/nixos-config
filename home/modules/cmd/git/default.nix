{
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Miroslav Lincovschi";
    userEmail = "lincovsci02@gmail.com";
  };
}
