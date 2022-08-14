local ok, trouble = pcall(require, "trouble")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

trouble.setup {
  position = "right",
  width = 35,
  auto_fold = true,
  auto_preview = false,
  use_diagnostic_signs = true,
  action_keys = {
    toggle_fold = "<Space>",
    refresh = "R",
  },
}

nnoremap { [[\\]], "<Cmd>TroubleToggle<CR>" }
