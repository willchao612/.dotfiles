local ok, tree = pcall(require, "nvim-tree")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

tree.setup {
  disable_netrw = true,
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

local function open_nvim_tree(data)
  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then return end

  -- change to the directory
  if directory then vim.cmd.cd(data.file) end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
