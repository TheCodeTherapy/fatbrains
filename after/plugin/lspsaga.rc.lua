local lspsagastatus, lspsaga = pcall(require, "lspsaga")
if not lspsagastatus then
  return
end

lspsaga.init_lsp_saga({
  border_style = "rounded",
  server_filetype_map = {},
  finder_action_keys = {
    tabe = { "o", "<CR>" },
    vsplit = "s",
    split = "i",
    open = "t",
    quit = { "q", "<ESC>" },
  },
})

local opts = { noremap = true, silent = true }
vim.diagnostic.config({
  update_in_insert = true,
  severity_sort = true,
})
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
vim.keymap.set("n", "<leader>cs", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga hover_doc<cr>", opts)
vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<cr>", opts)
vim.keymap.set("n", "go", "<cmd>Lspsaga outline<cr>", opts)
vim.keymap.set("n", "gp", "<cmd>Lspsaga preview_definition<cr>", opts)
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
