require("gitsigns").setup {
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
  keymaps = {
    noremap = true,
    buffer = true,
    ["n ]c"] = {
      expr = true,
      "&diff ? ']c' : '<Cmd>lua require\"gitsigns\".next_hunk()<CR>'",
    },
    ["n [c"] = {
      expr = true,
      "&diff ? '[c' : '<Cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
    },
    ["n ghs"] = '<Cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n ghu"] = '<Cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n ghr"] = '<Cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n ghR"] = '<Cmd>lua require"gitsigns".reset_buffer()<CR>',
    ["n ghp"] = '<Cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n ghb"] = '<Cmd>lua require"gitsigns".blame_line()<CR>',
    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
  },
}
