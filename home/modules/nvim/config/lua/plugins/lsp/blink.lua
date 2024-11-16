return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  opts = {
    keymap = "super-tab",
    nerd_font_variant = "normal",
    windows = {
      autocomplete = {
        border = "rounded",
        draw = "reversed",
      },
      documentation = {
        border = "rounded",
      },
      signature_help = {
        border = "rounded",
      },
      ghost_text = {
        enabled = true,
      },
    },
    accept = {
      create_undo_point = false,
      -- experimental auto-brackets support
      auto_brackets = { enabled = true },
    },

    -- experimental signature help support
    trigger = { signature_help = { enabled = true } },
  },
}
