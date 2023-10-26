vim.opt_local.fo:append { "B" }

vim.cmd [[iabbrev <buffer> h1 #]]
vim.cmd [[iabbrev <buffer> h2 ##]]
vim.cmd [[iabbrev <buffer> h3 ###]]
vim.cmd [[iabbrev <buffer> h4 ####]]
vim.cmd [[iabbrev <buffer> h5 #####]]
vim.cmd [[iabbrev <buffer> h6 ######]]

local typora_cmd
if vim.fn.has "macunix" == 1 then
  typora_cmd = "<Cmd>silent !open -a typora %<CR>"
elseif vim.fn.executable "typora" then
  typora_cmd = "<Cmd>silent !typora %<CR>"
end

vim.keymap.set(
  "n",
  "<Leader>O",
  typora_cmd,
  { noremap = true, buffer = true, silent = true }
)
