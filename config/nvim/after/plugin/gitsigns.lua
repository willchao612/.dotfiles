local ok, signs = pcall(require, "gitsigns")
if not ok then return end

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
    ["n <Leader>gp"] = '<Cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <Leader>gb"] = '<Cmd>lua require"gitsigns".blame_line()<CR>',
    ["n <Leader>gd"] = '<Cmd>lua require"gitsigns".diffthis()<CR>',
    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
  },
  current_line_blame = true,
}
