local M = {}

local function bind(mod, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(tbl)
    local lhs, rhs, opts = tbl[1], tbl[2], tbl[3]
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(mod, lhs, rhs, opts)
  end
end

M.map = bind("", { noremap = false })
M.nmap = bind("n", { noremap = false })
M.xmap = bind("x", { noremap = false })
M.nnoremap = bind "n"
M.vnoremap = bind "v"
M.xnoremap = bind "x"
M.inoremap = bind "i"
M.onoremap = bind "o"
M.cnoremap = bind "c"
M.snoremap = bind "s"
M.tnoremap = bind "t"

return M
