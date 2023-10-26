local ok, signs = pcall(require, "gitsigns")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap
local onoremap = Remap.onoremap
local xnoremap = Remap.xnoremap

signs.setup {
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "▍",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      text = "▍",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = "▸",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "▾",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "▍",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  on_attach = function(bufnr)
    -- navigation
    -- TODO: Why this is not working?
    nnoremap {
      "]c",
      "&diff ? ']c' : '<Cmd>lua require\"gitsigns\".next_hunk()<CR>'",
      { expr = true },
    }
    nnoremap {
      "[c",
      "&diff ? '[c' : '<Cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
      { expr = true },
    }

    -- actions
    nnoremap { "<Leader>gp", '<Cmd>lua require"gitsigns".preview_hunk()<CR>' }
    nnoremap { "<Leader>gb", '<Cmd>lua require"gitsigns".blame_line()<CR>' }
    nnoremap { "<Leader>gd", '<Cmd>lua require"gitsigns".diffthis()<CR>' }

    -- text objects
    onoremap { "ih", ':<C-U>lua require"gitsigns".select_hunk()<CR>' }
    xnoremap { "ih", ':<C-U>lua require"gitsigns".select_hunk()<CR>' }
  end,
  current_line_blame = true,
}
