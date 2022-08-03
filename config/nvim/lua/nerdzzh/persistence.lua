local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

require("persistence").setup {}

nnoremap(
  "<Leader>sl",
  function() require("persistence").load { last = true } end
)
nnoremap(
  "<Leader>sc",
  function() require("persistence").load { last = false } end
)
