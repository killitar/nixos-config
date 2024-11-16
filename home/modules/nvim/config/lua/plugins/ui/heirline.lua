return {
  "rebelot/heirline.nvim",
  event = "UIEnter",
  config = function()
    local colors = require("obscure.palettes").get_palette("obscure")
    local icons = {
      diagnostics = {
         Error_alt = "󰅚 ",
         Warning_alt = "󰀪 ",
         Information_alt = " ",
         Question_alt = " ",
         Hint_alt = "󰌶 ",
      },
      git = {
         Add = " ",
         Branch = " ",
         Remove = " ",
         Mod_alt = " ",
      },
      ui = {
         Circle_alt = " ",
         Close = "󰅖 ",
         Close_circle = "󰅙 ",
         Right = " ",
         Left = " ",
      },
    }
    local separator_statusline = { left = "", right = "" }
    local separator_tabline = { left = "▏", right = "▕" }

    local StatusLines = require("plugins.ui.heirline_config.StatusLines").get(colors, separator_statusline, icons)
    local TabLine = require("plugins.ui.heirline_config.TabLine").get(colors, separator_tabline, icons)

    require("heirline").setup({
      statusline = StatusLines,
      tabline = TabLine,
    })
  end,
}
