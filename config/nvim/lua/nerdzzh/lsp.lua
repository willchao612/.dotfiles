local Remap = require "nerdzzh.keymap"
local nnoremap = Remap.nnoremap

require("luasnip.loaders.from_vscode").lazy_load()

local source_mapping = {
  buffer = "[Buffer]",
  luasnip = "[Snip]",
  nvim_lsp = "[LSP]",
  nvim_lsp_signature_help = "[Help]",
  path = "[Path]",
}

local lspkind = require "lspkind"
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-U>"] = cmp.mapping.scroll_docs(-4),
    ["<C-D>"] = cmp.mapping.scroll_docs(4),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      vim_item.menu = menu
      return vim_item
    end,
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "path" },
  },
  experimental = {
    ghost_text = true,
  },
}
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" }, { name = "nvim_lsp_document_symbol" } },
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "cmdline" }, { name = "path" } },
})

require("lua-dev").setup {}
require("nvim-lsp-installer").setup {
  automatic_installation = true,
  ui = {
    border = "single",
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

local config = function(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function()
      nnoremap("gla", function() vim.lsp.buf.code_action() end)
      nnoremap("gls", function() vim.lsp.buf.hover() end)
      nnoremap("grr", function() vim.lsp.buf.rename() end)
    end,
  }, _config or {})
end

require("lspconfig").bashls.setup(config())
require("lspconfig").ccls.setup(config())
require("lspconfig").cssls.setup(config())
require("lspconfig").emmet_ls.setup(config())
require("lspconfig").html.setup(config())
require("lspconfig").jsonls.setup(config())
require("lspconfig").pyright.setup(config())
require("lspconfig").rust_analyzer.setup(config())
require("lspconfig").sumneko_lua.setup(config {
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
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
require("lspconfig").tsserver.setup(config())
require("lspconfig").vimls.setup(config())
require("lspconfig").vuels.setup(config())

require("symbols-outline").setup {}
nnoremap("<C-t>", "<Cmd>SymbolsOutline<CR>")

require("trouble").setup {
  position = "right",
  width = 45,
  auto_preview = false,
  use_diagnostic_signs = true,
  action_keys = {
    toggle_fold = "<Space>",
    refresh = "R",
  },
}
nnoremap([[\\]], "<Cmd>TroubleToggle<CR>")

require("fidget").setup { text = { spinner = "meter" } }
