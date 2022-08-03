local Remap = require "nerdzzh.keymap"
local nmap = Remap.nmap
local xmap = Remap.xmap

require("kommentary.config").configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})
nmap(";c", "<Plug>kommentary_line_default")
xmap(";c", "<Plug>kommentary_visual_default<C-c>")
