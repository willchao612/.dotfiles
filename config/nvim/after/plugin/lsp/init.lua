local ok, lspconfig = pcall(require, "lspconfig")
if not ok then return end

local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- Mason needs to be configured before any lspconfig setup

require("mason").setup {
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

require("mason-lspconfig").setup {
  automatic_installation = true,
}

require("neodev").setup {} -- Vim API signature help support by @folke

local config = function(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
      nnoremap { "gla", vim.lsp.buf.code_action }
      nnoremap { "gls", vim.lsp.buf.hover }
      nnoremap { "grr", vim.lsp.buf.rename }

      inoremap { "<C-h>", vim.lsp.buf.signature_help }

      -- Breadcrumb tabline as lualine component
      require("nvim-navic").attach(client, bufnr)
    end,
  }, _config or {})
end

lspconfig.bashls.setup(config())
lspconfig.clangd.setup(config())
lspconfig.cssls.setup(config())
lspconfig.emmet_ls.setup(config())
lspconfig.html.setup(config())
lspconfig.jsonls.setup(config())
lspconfig.pyright.setup(config())
lspconfig.rust_analyzer.setup(config())
lspconfig.tsserver.setup(config())
lspconfig.vimls.setup(config())
lspconfig.vuels.setup(config())

lspconfig.lua_ls.setup(config {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        -- HACK: https://github.com/neovim/nvim-lspconfig/issues/1700#issuecomment-1033127328
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
