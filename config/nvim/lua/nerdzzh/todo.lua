local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

require("todo-comments").setup { keywords = { TODO = { alt = { "WIP" } } } }

nnoremap("<Leader>tx", "<Cmd>TodoTrouble<CR>")
nnoremap("<Leader>tz", "<Cmd>TodoTelescope<CR>")
