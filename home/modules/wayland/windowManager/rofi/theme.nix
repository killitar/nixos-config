{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg-col = mkLiteral "#121221";
        bg-alt = mkLiteral "#1e1e2e";
        bg-col-light = mkLiteral "#1e1e2e";
        border-col = mkLiteral "#89b4fa";
        selected-col = mkLiteral "#121221";
        blue = mkLiteral "#89b4fa";
        red = mkLiteral "#f38ba8";
        fg-col = mkLiteral "#cdd6f4";
        grey = mkLiteral "#6c7086";

        width = 300;
      };
      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "window" = {
        height = mkLiteral "350px";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
      };

      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = map mkLiteral ["prompt" "entry"];
        background-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "4px";
        padding = mkLiteral "1px";
      };

      "prompt" = {
        background-color = mkLiteral "@blue";
        padding = mkLiteral "5px";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "4px";
        margin = mkLiteral "5px 0px 0px 5px";
      };

      "textbox-prompt-colon" = {
        expand = "false";
        str = ":";
      };

      "entry" = {
        padding = mkLiteral "3px";
        border-radius = mkLiteral "4px";
        margin = mkLiteral "5px 5px 0px 5px";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-alt";
      };

      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "5px 7px 0px 5px";
        columns = "2";
        lines = "8";
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = mkLiteral "5px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
      };

      "element-icon" = {size = mkLiteral "16px";};

      "element selected" = {
        background-color = mkLiteral "@blue";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "4px";
      };

      "button" = {
        padding = mkLiteral "5px";
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@blue";
      };

      "textbox" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        placeholder-color = mkLiteral "@fg-col";
        blink = true;
        markup = true;
      };

      "error-message" = {
        padding = mkLiteral "5px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "2px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@red";
      };
    };
  };
}
