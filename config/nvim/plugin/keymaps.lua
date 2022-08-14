local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local cnoremap = Remap.cnoremap
local onoremap = Remap.onoremap

-- Normal mode
nnoremap { "H", "^" }
nnoremap { "L", "$" }

nnoremap { ";w", "<Cmd>write<CR>" }
nnoremap { ";q", "<Cmd>quit<CR>" }
nnoremap { ";u", "<Cmd>undo 0<CR>" }
nnoremap { ";t", "<Cmd>edit ~/.todo<CR>" }

nnoremap { "<C-h>", "<C-w>h" }
nnoremap { "<C-j>", "<C-w>j" }
nnoremap { "<C-k>", "<C-w>k" }
nnoremap { "<C-l>", "<C-w>l" }

nnoremap { "<C-f>", "<Cmd>bnext<CR>" }
nnoremap { "<C-b>", "<Cmd>bprevious<CR>" }

nnoremap { "n", "nzz" }
nnoremap { "N", "Nzz" }
nnoremap { "<C-o>", "<C-o>zz" }

nnoremap { "J", "mzJ`z" }

nnoremap { "<Space>", "za" }

nnoremap { "=-", "mzggVG=`z" }

nnoremap { ";;", "<C-^>" }

nnoremap { "z;", "zMzvzz" }

nnoremap { "\\s", "<Cmd>setlocal spell!<CR>" }

nnoremap {
  "<Leader>ed",
  "<Cmd>edit ~/.config/nvim/spell/custom-dictionary.utf-8.add<CR>",
}
nnoremap { "<Leader>eg", "<Cmd>edit ~/.gitconfig<CR>" }
nnoremap { "<Leader>et", "<Cmd>edit ~/.tmux.conf<CR>" }
nnoremap { "<Leader>ez", "<Cmd>edit ~/.zsh_profile<CR>" }

nnoremap { "<Leader>bd", "<Cmd>bprevious | bdelete #<CR>" }
nnoremap { "<Leader>sa", "ggVG" }
nnoremap { "<Leader>ss", "Vip:sort<CR>" }
nnoremap { "<Leader>sd", function() vim.call "nerdzzh#diff_no_git" end }

nnoremap { "<Leader>cn", "<Cmd>cnext<CR>zz" }
nnoremap { "<Leader>cp", "<Cmd>cprevious<CR>zz" }

nnoremap { "<Leader>ln", "<Cmd>lnext<CR>zz" }
nnoremap { "<Leader>lp", "<Cmd>lprevious<CR>zz" }

nnoremap { "<Leader><Space>", "<Cmd>nohlsearch<CR>" }

nnoremap { "<Leader>x", function() vim.call "nerdzzh#exec_line" end }
nnoremap {
  "<Leader><Leader>x",
  function() vim.call "nerdzzh#save_and_exec" end,
}

nnoremap { "<Leader><Tab>", "gt" }
nnoremap { "<Leader><S-Tab>", "gT" }

nnoremap { "<Leader>r", ":%s/<C-r><C-w>//g<Left><Left>" }

-- Insert mode
inoremap { "jk", "<Esc>" }
inoremap { "<C-c>", "<Esc>" }

inoremap { "<C-l>", "<C-x><C-k>" }
inoremap { "<C-f>", "<C-x><C-f>" }

inoremap { "<C-p>", '<Esc>"+pV`]=`]a' }

-- Visual mode
vnoremap { "H", "g^" }
vnoremap { "L", "g_" }

vnoremap { ">", ">gv" }
vnoremap { "<", "<gv" }

vnoremap { "<Space>", "za" }

vnoremap { "p", '"_dP' }

vnoremap { "J", ":move '>+1<CR>gv=gv" }
vnoremap { "K", ":move '<-2<CR>gv=gv" }

vnoremap { ";y", '"+y' }

vnoremap { "<Leader>r", '"hy:%s/<C-r>h//g<Left><Left>' }

vnoremap { "<Leader>ss", ":sort<CR>" }

-- Cmdline mode
cnoremap { "<C-a>", "<Home>" }
cnoremap { "<C-e>", "<End>" }
cnoremap { "<C-f>", "<Right>" }
cnoremap { "<C-b>", "<Left>" }
cnoremap { "<C-u>", "<C-e><C-u>" }

-- Operator-pending mode
onoremap { "H", "^" }
onoremap { "L", "$" }

onoremap { "q", 'i"' }
onoremap { "o", "i'" }
onoremap { "b", "i`" }
onoremap { "p", "i)" }
onoremap { "u", "i]" }
onoremap { "r", "i}" }
