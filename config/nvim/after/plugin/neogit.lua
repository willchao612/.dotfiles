local ok, neogit = pcall(require, "neogit")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

neogit.setup {
  kind = "split",
  signs = {
    -- { CLOSED, OPENED }
    section = { "", "" },
    item = { "", "" },
    hunk = { "", "" },
  },
  disable_builtin_notifications = true,
}

nnoremap { "<Leader>gs", neogit.open }
