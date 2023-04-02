vim.opt_local.fo:append { "B" }

vim.cmd [[iabbrev <buffer> h1 #]]
vim.cmd [[iabbrev <buffer> h2 ##]]
vim.cmd [[iabbrev <buffer> h3 ###]]
vim.cmd [[iabbrev <buffer> h4 ####]]
vim.cmd [[iabbrev <buffer> h5 #####]]
vim.cmd [[iabbrev <buffer> h6 ######]]

if vim.fn.executable "typora" then
  vim.keymap.set(
    "n",
    "<Leader>O",
    "<Cmd>silent !typora %<CR>",
    { noremap = true, buffer = true, silent = true }
  )
end
