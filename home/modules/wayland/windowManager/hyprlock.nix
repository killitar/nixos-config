{pkgs, ...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = false;
        hide_cursor = true;
        grace = 0;
        no_fade_in = false;
      };

      background = [
        {
          monitor = ""; # All monitors
          path = "~/nix/assets/walls/001.jpg";
          blur_passes = 2;
          brightness = 0.5;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = {
            width = 250;
            height = 60;
          };
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.5)";
          font_color = "rgb(200, 200, 200)";
          font_family = "IosevkaTerm Nerd Font";
          fade_on_empty = false;
          placeholder_text = "<b>Password...</b>";
          hide_input = false;
          position = {
            x = 0;
            y = -150;
          };
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 120;
          position = {
            x = 0;
            y = 0;
          };
          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
