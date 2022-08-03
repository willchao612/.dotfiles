local gps = require "nvim-gps"
require("nvim-gps").setup {}
require("lualine").setup {
  options = {
    theme = "gruvbox",
    globalstatus = true,
  },
  tabline = {
    lualine_a = { "buffers" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { { gps.get_location, cond = gps.is_available } },
    lualine_y = {},
    lualine_z = { "tabs" },
  },
  extensions = {
    "nvim-tree",
    "fugitive",
    "quickfix",
    "man",
    "toggleterm",
    "mundo",
    "symbols-outline",
  },
}
