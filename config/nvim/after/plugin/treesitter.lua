local ok, config = pcall(require, "nvim-treesitter.configs")
if not ok then return end

config.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = false,
    },
  },
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["gpn"] = "@parameter.inner",
      },
      swap_previous = {
        ["gpp"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["gfn"] = "@function.outer",
      },
      goto_previous_start = {
        ["gfp"] = "@function.outer",
      },
    },
  },
  textsubjects = {
    enable = true,
    prev_selection = "-",
    keymaps = {
      ["+"] = "textsubjects-smart",
    },
  },
  context_commentstring = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
  },
  matchup = {
    enable = true,
  },
}

require("treesitter-context").setup {
  enable = true,
  throttle = true,
  show_all_context = true,
  patterns = {
    default = {
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
  },
}

require("spellsitter").setup {}
