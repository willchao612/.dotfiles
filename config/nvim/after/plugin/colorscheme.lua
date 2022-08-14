vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_italic = 1
vim.g.gruvbox_italicize_comments = 1
vim.g.gruvbox_sign_column = "bg0"
vim.g.gruvbox_transparent_bg = 1

vim.opt.termguicolors = true
vim.cmd [[colorscheme gruvbox]]

-- Italicize keywords
vim.api.nvim_set_hl(0, "Keyword", { fg = "#fb4934", italic = 1 }) -- gruvbox_red
