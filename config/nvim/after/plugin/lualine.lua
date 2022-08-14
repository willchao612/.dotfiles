local ok, lualine = pcall(require, "lualine")
if not ok then return end

local navic = require "nvim-navic"
navic.setup { depth_limit = 4 }

lualine.setup {
  options = {
    theme = "gruvbox",
    globalstatus = true,
  },
  tabline = {
    lualine_a = { "buffers" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { { navic.get_location, cond = navic.is_available } },
    lualine_y = {},
    lualine_z = { "tabs" },
  },
  extensions = {
    "nvim-tree",
    "quickfix",
    "man",
    "toggleterm",
    "mundo",
    "symbols-outline",
  },
}
