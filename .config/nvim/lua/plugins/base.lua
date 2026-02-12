return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "tiagovla/scope.nvim",
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        color_icons = false,
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        auto_toggle_burreline = false,
        separator_style = "thin",
      },
      highlights = {
        buffer_selected = {
          bold = false,
          italic = false,
        },
      },
    },
  },
}
