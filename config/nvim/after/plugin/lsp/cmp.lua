local ok, cmp = pcall(require, "cmp")
if not ok then return end

require("luasnip.loaders.from_vscode").lazy_load()

local lspkind = require "lspkind"

local source_mapping = {
  buffer = "[Buffer]",
  luasnip = "[Snip]",
  nvim_lsp = "[LSP]",
  nvim_lsp_signature_help = "[Help]",
  path = "[Path]",
}

cmp.setup {
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert {
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
