local ok, telescope = pcall(require, "telescope")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

telescope.setup {
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    prompt_prefix = "🔍",
    mappings = {
      n = {
        ["q"] = actions.close,
      },
      i = {
        ["<C-q>"] = actions.close,
        ["<C-s>"] = actions.send_to_loclist,
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

-- Extensions must be loaded after the setup function
telescope.load_extension "fzf"

nnoremap { "<Leader>lc", builtin.command_history }
nnoremap { "<Leader>ld", builtin.git_bcommits }
nnoremap { "<Leader>lf", builtin.find_files }
nnoremap { "<Leader>lh", builtin.help_tags }
nnoremap { "<Leader>li", builtin.builtin }
nnoremap { "<Leader>lk", builtin.keymaps }
nnoremap { "<Leader>ll", builtin.git_commits }
nnoremap { "<Leader>ls", builtin.buffers }

nnoremap {
  "<Leader>lg",
  function() builtin.grep_string { search = vim.fn.input "Grep For > " } end,
}

nnoremap {
  "<Leader>lr",
  function()
    builtin.find_files {
      prompt_title = "Search Dotfiles",
      cwd = vim.env.DOTFILES,
      find_command = { "rg", "--files", "--glob", "!.git/" },
      follow = false,
      hidden = true,
    }
  end,
}

nnoremap { "gld", builtin.lsp_definitions }
nnoremap { "glr", builtin.lsp_references }

nnoremap { "<Leader>gco", builtin.git_branches }
