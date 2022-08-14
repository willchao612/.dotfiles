local ok, todo = pcall(require, "todo-comments")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

todo.setup { keywords = { TODO = { alt = { "WIP" } } } }

nnoremap { "<Leader>lt", "<Cmd>TodoTelescope<CR>" }
