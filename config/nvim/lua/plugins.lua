--[[
Author: Will Chao <nerdzzh@gmail.com>
Last Modified: Saturday, 18 February 2023

Credits: These neovim configs are hugely inspired by
  - @ThePrimeagen/.dotfiles
  - @folke/dot
  - @tjdevries/config_manager
--]]

vim.cmd [[packadd packer.nvim]]
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local has = function(x) return vim.fn.has(x) == 1 end

local executable = function(x) return vim.fn.executable(x) == 1 end

local is_wsl = (function()
  local output = vim.fn.systemlist "uname -r"
  return not not string.find(output[1] or "", "WSL")
end)()

local is_mac = has "macunix"
local is_linux = not is_wsl and not is_mac

local max_jobs = nil
if is_mac then max_jobs = 32 end

return require("packer").startup {
  function(use)
    local local_use = function(first, second, opts)
      opts = opts or {}

      local plug_path, home
      if second == nil then
        plug_path = first
        home = "willchao612"
      else
        plug_path = second
        home = first
      end

      if vim.fn.isdirectory(vim.fn.expand("~/Personal/" .. plug_path)) == 1 then
        opts[1] = "~/Personal/" .. plug_path
      else
        opts[1] = string.format("%s/%s", home, plug_path)
      end

      use(opts)
    end

    -- Packer manages itself
    use {
      "wbthomason/packer.nvim",
      config = function() vim.cmd [[nnoremap <Leader>sv <Cmd>PackerSync<CR>]] end,
    }

    -- Plugins I created
    local_use("vim-diagon", nil, {
      -- setup = function() vim.g.diagon_use_echo = 1 end,
      config = function() vim.cmd [[xnoremap <Leader>ds :Diagon Sequence<CR>]] end,
    })

    -- LSP:
    use {
      "neovim/nvim-lspconfig",
      requires = {
        { "williamboman/mason.nvim", module = "mason" },
        { "williamboman/mason-lspconfig.nvim", module = "mason-lspconfig" },
        { "simrat39/symbols-outline.nvim", module = "symbols-outline" },
        { "j-hui/fidget.nvim", module = "fidget" },
        { "folke/neodev.nvim", module = "neodev" },
      },
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      module = "nvim-treesitter",
      requires = {
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-textsubjects",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "windwp/nvim-ts-autotag",
        "p00f/nvim-ts-rainbow",
        {
          "andymass/vim-matchup",
          setup = function() vim.g.matchup_matchparen_offscreen = {} end,
          config = function() vim.cmd [[map <Tab> %]] end,
        },
        {
          "nvim-treesitter/nvim-treesitter-context",
          module = "treesitter-context",
        },
        { "lewis6991/spellsitter.nvim", module = "spellsitter" },
      },
    }

    -- Cmp
    use {
      "hrsh7th/nvim-cmp",
      module = "cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        { "onsails/lspkind.nvim", module = "lspkind" },
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        { "windwp/nvim-autopairs", module = "nvim-autopairs" },
        {
          "uga-rosa/cmp-dictionary",
          requires = { "nvim-lua/plenary.nvim" },
          config = function()
            vim.cmd [[autocmd FileType markdown CmpDictionaryUpdate]]
          end,
        },
      },
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        "nvim-telescope/telescope-symbols.nvim",
      },
    }

    -- Neoformat
    use {
      "sbdchd/neoformat",
      setup = function() require "config.neoformat" end,
      config = function()
        vim.cmd [[nnoremap <Leader>F <Cmd>Neoformat<CR>]]

        -- Autocmd (format on save) *except* markdown files
        -- HACK: https://stackoverflow.com/a/67463224
        vim.cmd [[
          augroup format_on_save
            autocmd!
            autocmd BufWritePre *\(*.\(md\|markdown\)\)\@<! Neoformat
          augroup END
        ]]
      end,
    }

    -- Theme / UI
    use { "morhetz/gruvbox", event = "ColorSchemePre" }
    use {
      "kyazdani42/nvim-web-devicons",
      config = function() require("nvim-web-devicons").setup { default = true } end,
    }
    use {
      "nvim-lualine/lualine.nvim",
      module = "lualine",
      requires = {
        {
          "SmiteshP/nvim-navic",
          module = "nvim-navic",
          requires = { "neovim/nvim-lspconfig" },
          setup = function() vim.g.navic_silence = true end,
        },
      },
    }
    use { "kyazdani42/nvim-tree.lua", module = "nvim-tree" }
    use { "lukas-reineke/indent-blankline.nvim", module = "indent_blankline" }

    -- Other goodies @folke created
    use { "folke/trouble.nvim", module = "trouble" }
    use { "folke/todo-comments.nvim", module = "todo-comments" }
    use { "folke/persistence.nvim", module = "persistence" }

    -- Terminal
    use { "akinsho/toggleterm.nvim", module = "toggleterm" }

    -- Git
    use { "TimUntersberger/neogit", requires = { "nvim-lua/plenary.nvim" } }
    use { "lewis6991/gitsigns.nvim", module = "gitsigns" }

    -- LANGUAGE:
    use {
      "plasticboy/vim-markdown",
      ft = "markdown",
      setup = function() require "config.markdown" end,
      config = function() vim.cmd [[nnoremap <Leader>T <Cmd>Toc<CR>]] end,
    }
    use {
      "mzlogin/vim-markdown-toc",
      ft = "markdown",
      setup = function() require "config.markdown_toc" end,
      config = function()
        vim.cmd [[autocmd FileType markdown nnoremap <buffer> <LocalLeader>t <Cmd>GenTocGFM<CR>]]
      end,
    }
    use {
      "heavenshell/vim-jsdoc",
      ft = { "javascript", "javascript.jsx", "typescript" },
      run = "make install",
      config = function()
        vim.cmd [[autocmd FileType javascript nnoremap <buffer> <LocalLeader>d <Cmd>JsDoc<CR>]]
      end,
    }
    use {
      "preservim/vim-litecorrect",
      config = function()
        vim.cmd [[
          augroup litecorrect
            autocmd!
            autocmd FileType markdown,mkd call litecorrect#init()
            autocmd FileType textile call litecorrect#init()
          augroup END
        ]]
      end,
    }
    use "neoclide/jsonc.vim"

    -- Startup
    use {
      "dstein64/vim-startuptime",
      setup = function() vim.g.startuptime_split_edit_key_seq = "<CR>" end,
      config = function()
        vim.cmd [[autocmd FileType startuptime nnoremap <buffer><silent> q <Cmd>quit<CR>]]
        vim.cmd [[nnoremap <Leader>st <Cmd>StartupTime<CR>]]
      end,
    }
    -- use "lewis6991/impatient.nvim"

    -- Other goodies
    use {
      "b3nj5m1n/kommentary",
      setup = function() vim.g.kommentary_create_default_mappings = false end,
    }
    use { "karb94/neoscroll.nvim", module = "neoscroll" }
    use { "norcalli/nvim-colorizer.lua", module = "colorizer" }
    use {
      "godlygeek/tabular",
      config = function()
        vim.cmd [[map ;a= :Tabularize /=<CR>]]
        vim.cmd [[map ;a: :Tabularize /:<CR>]]
      end,
    }
    use {
      "simnalamburt/vim-mundo",
      setup = function() vim.g.mundo_right = 1 end,
      config = function() vim.cmd [[nnoremap <Leader>ud <Cmd>MundoToggle<CR>]] end,
    }
    use "rhysd/clever-f.vim"
    use "rlue/vim-barbaric"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
  end,

  config = {
    max_jobs = max_jobs,
    luarocks = {
      python_cmd = "python3",
    },
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
      prompt_border = "single",
    },
  },
}
