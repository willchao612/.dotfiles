local ok, term = pcall(require, "toggleterm")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

term.setup {
  open_mapping = "<F3>",
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "single",
    width = math.floor(vim.o.columns * 0.80),
    height = math.floor((vim.o.lines - vim.o.cmdheight - 1) * 0.85),
  },
}

local cmd_tbl = {
  c = "gcc % -o test && ./test && rm test",
  cpp = "g++ % -o test && ./test && rm test",
  javascript = "node %",
  lua = "lua %",
  python = "python3 %",
  rust = "rustc % -o test && ./test && rm test",
  sh = "chmod +x % && bash %",
}

nnoremap {
  "<F4>",
  function()
    local ft = vim.bo.filetype
    if cmd_tbl[ft] == nil then return end
    vim.cmd([[7TermExec cmd="]] .. cmd_tbl[ft] .. [["]])
  end,
}
