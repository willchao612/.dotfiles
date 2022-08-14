local ok, symbols = pcall(require, "symbols-outline")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

symbols.setup {}

nnoremap { "<C-t>", "<Cmd>SymbolsOutline<CR>" }
