local ok, persist = pcall(require, "persistence")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

persist.setup {}

nnoremap { "<Leader>sl", persist.load }
