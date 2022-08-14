local ok, blankline = pcall(require, "indent_blankline")
if not ok then return end

blankline.setup {
  filetype_exclude = { "help", "qf", "man", "NvimTree" },
  show_current_context = true,
  use_treesitter = true,
}
