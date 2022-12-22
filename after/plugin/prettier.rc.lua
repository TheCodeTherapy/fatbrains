local prettierstatus, prettier = pcall(require, "prettier")
if not prettierstatus then
  return
end

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less",
  },
})
