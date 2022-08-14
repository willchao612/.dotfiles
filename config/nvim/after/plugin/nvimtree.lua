local ok, tree = pcall(require, "nvim-tree")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

tree.setup {
  disable_netrw = true,
  open_on_setup = true,
  create_in_closed_folder = true,
  sort_by = "extension",
  hijack_unnamed_buffer_when_opening = true,
  hijack_cursor = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  renderer = {
    group_empty = true,
    root_folder_modifier = ":~:.",
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = "signcolumn",
      show = {
        folder = false,
        folder_arrow = false,
      },
    },
  },
}

nnoremap { "<F2>", "<Cmd>NvimTreeToggle<CR>" }
