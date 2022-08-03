local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

require("nvim-tree").setup {
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
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
nnoremap("<F2>", "<Cmd>NvimTreeToggle<CR>")
