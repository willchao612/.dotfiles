local ok, config = pcall(require, "kommentary.config")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nmap = Remap.nmap
local xmap = Remap.xmap

config.configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true,
})

nmap { ";c", "<Plug>kommentary_line_default" }
xmap { ";c", "<Plug>kommentary_visual_default<C-c>" }
