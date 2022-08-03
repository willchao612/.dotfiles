local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    prompt_prefix = "🔍",
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
        ["<C-q>"] = actions.close,
      },
    },
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.95,
      width = 0.90,
      preview_cutoff = 80,
      preview_width = 0.50,
    },
  },
}
require("telescope").load_extension "fzf"
require("nvim-web-devicons").setup { default = true }

nnoremap("<Leader>tb", function() require("telescope.builtin").buffers {} end)
nnoremap(
  "<Leader>tc",
  function() require("telescope.builtin").command_history {} end
)
nnoremap(
  "<Leader>td",
  function() require("telescope.builtin").git_bcommits {} end
)
nnoremap("<Leader>te", function() require("telescope.builtin").builtin {} end)
nnoremap(
  "<Leader>tf",
  function() require("telescope.builtin").find_files {} end
)
nnoremap(
  "<Leader>tg",
  function()
    require("telescope.builtin").grep_string {
      search = vim.fn.input "Grep For > ",
    }
  end
)
nnoremap("<Leader>th", function() require("telescope.builtin").help_tags {} end)
nnoremap("<Leader>tk", function() require("telescope.builtin").keymaps {} end)
nnoremap(
  "<Leader>tl",
  function() require("telescope.builtin").git_commits {} end
)
nnoremap("<Leader>tm", function() require("telescope.builtin").man_pages {} end)
nnoremap("<Leader>tq", function() require("telescope.builtin").quickfix {} end)
nnoremap(
  "<Leader>tr",
  function()
    require("telescope.builtin").find_files {
      prompt_title = "< VimRC >",
      cwd = vim.env.DOTFILES,
      find_command = { "rg", "--files", "--glob", "!.git/" },
      follow = false,
      hidden = true,
    }
  end
)
nnoremap("<Leader>ts", function() require("telescope.builtin").symbols {} end)
nnoremap(
  "<Leader>tt",
  function() require("telescope.builtin").treesitter {} end
)

nnoremap("gld", function() require("telescope.builtin").lsp_definitions {} end)
nnoremap("glr", function() require("telescope.builtin").lsp_references {} end)
