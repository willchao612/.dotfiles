local ok, colorizer = pcall(require, "colorizer")
if not ok then return end

vim.opt.termguicolors = true
colorizer.setup({
  "css",
  "html",
  "less",
  "scss",
  "vue",
}, {
  RGB = true,
  RRGGBB = true,
  RRGGBBAA = true,
  names = true,
  rgb_fn = true,
  hsl_fn = true,
  css = true,
  css_fn = true,
  mode = "background",
})
