local lspconfigstatus, nvim_lsp = pcall(require, "lspconfig")
if not lspconfigstatus then
  return
end

local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.setup()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "eslint",
    "rust_analyzer",
    "clangd",
    "dockerls",
    "pyright",
    "taplo",
    "bashls",
    "dockerls",
    "jsonls",
    "tailwindcss",
    "vimls",
  },
  automatic_installation = true,
})

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ bufnr = bufnr })]])
    vim.api.nvim_command([[augroup END]])
  end
end

local setup = function()
  vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    virtual_text = {
      spacing = 4,
      prefix = "●",
    },
  })
  local signs = { Error = "✘", Warn = "", Hint = "", Info = "ⁱ" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
})

nvim_lsp.sumneko_lua.setup({
  setup = setup,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
        maxPreload = 10000,
      },
    },
  },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local clangd_capabilities = cmp_capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

local lspconfig = require("lspconfig.configs")
lspconfig.clangd.setup({
  capabilities = clangd_capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
})
