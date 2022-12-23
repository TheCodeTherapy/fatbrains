local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "bufwritepre"
local async = event == "bufwritepost"
local nlsstatus, nls = pcall(require, "null-ls")
if not nlsstatus then
  return
end

local builtins = nls.builtins

local sources = {
  builtins.code_actions.eslint_d,
  builtins.code_actions.gitsigns,
  builtins.diagnostics.eslint_d,
  builtins.diagnostics.markdownlint,
  builtins.formatting.eslint_d,
  builtins.formatting.prettierd.with({
    env = {
      PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
    },
  }),
  builtins.formatting.stylua,
}

nls.setup({
  sources = sources,
  on_attach = function(client, bufnr)
    -- require("notify")("null-ls attached")
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<C-p>", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<C-p>", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})
