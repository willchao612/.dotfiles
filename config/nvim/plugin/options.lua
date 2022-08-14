local indent = 2

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.tabstop = indent
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.smartindent = true

vim.opt.list = true
vim.opt.listchars =
  { tab = "» ", extends = "›", precedes = "‹", nbsp = "·", trail = "·" }

vim.opt.textwidth = 80
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "+1"
vim.opt.cursorline = true
vim.opt.laststatus = 3

vim.opt.mouse = "a"
vim.opt.shell = vim.env.SHELL

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showbreak = "↪"
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.modelines = 1

vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 10

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.dictionary = "/usr/share/dict/words"
vim.opt.spellfile = vim.env.HOME
  .. "/.config/nvim/spell/custom-dictionary.utf-8.add"

vim.opt.autowrite = true
vim.opt.confirm = true

vim.opt.foldlevel = 99
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{,}"

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.updatetime = 50
vim.opt.virtualedit:append { "block" }

vim.opt.shortmess:append { s = true }
vim.opt.shortmess:append { I = true }
vim.opt.shortmess:append { c = true }

vim.opt.formatoptions:append "c"
vim.opt.formatoptions:append "r"
vim.opt.formatoptions:append "q"
vim.opt.formatoptions:append "n"
vim.opt.formatoptions:append "1"
vim.opt.formatoptions:append "j"

vim.opt.formatoptions:remove "t"
vim.opt.formatoptions:remove "o"
vim.opt.formatoptions:remove "a"
vim.opt.formatoptions:remove "2"

vim.opt.wildignore:append { ".git" }
vim.opt.wildignore:append { "*.jpg", "*.bmp", "*.gif", "*.png", "*.jpeg" }
vim.opt.wildignore:append { "*.obj", "*.exe", "*.dll" }
vim.opt.wildignore:append { "*.zip", "*.rar", "*.7z", "*.tar.gz" }
vim.opt.wildignore:append { "*.deb", "*.rpm", "*.pkg" }
vim.opt.wildignore:append { "*.spl" }
vim.opt.wildignore:append { "*.sw?" }
vim.opt.wildignore:append { "*.DS_Store" }

vim.opt.backup = true
vim.opt.swapfile = false
vim.opt.undodir = vim.env.HOME .. "/.config/nvim/tmp/undo//"
vim.opt.backupdir = vim.env.HOME .. "/.config/nvim/tmp/backup//"
vim.opt.directory = vim.env.HOME .. "/.config/nvim/tmp/swap//"

local folder = function(path) return vim.fn.isdirectory(path) == 1 end
local mkdir = function(path) vim.fn.mkdir(path, "p") end
if not folder(vim.opt.undodir:get()[1]) then mkdir(vim.opt.undodir:get()[1]) end
if not folder(vim.opt.backupdir:get()[1]) then
  mkdir(vim.opt.backupdir:get()[1])
end
if not folder(vim.opt.directory:get()[1]) then
  mkdir(vim.opt.directory:get()[1])
end
