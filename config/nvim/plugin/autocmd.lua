local augroup = vim.api.nvim_create_augroup
local NerdzzhGroup = augroup("Nerdzzh", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function() vim.highlight.on_yank { timeout = 300 } end,
})

autocmd({ "BufWritePre" }, {
  group = NerdzzhGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e | nohlsearch",
})

vim.cmd [[autocmd FocusGained * checktime]]
vim.cmd [[autocmd VimResized * wincmd =]]

vim.cmd [[autocmd BufWritePre * silent call nerdzzh#update_timestamps()]]

vim.cmd [[autocmd InsertEnter * set listchars-=trail:·]]
vim.cmd [[autocmd InsertLeave * set listchars+=trail:·]]

vim.cmd [[autocmd FileType help,qf,man nnoremap <buffer><silent> q <Cmd>quit<CR>]]
