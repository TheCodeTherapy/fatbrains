local toggletermstatus, toggleterm = pcall(require, "toggleterm")
if not toggletermstatus then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminal = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-z><up>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-z><right>", [[<C-\><C-n><C-W>l]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-z><down>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-z><left>", [[<C-\><C-n><C-W>h]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local lazygit = require("toggleterm.terminal").Terminal:new({
  cmd = "lazygit",
  hidden = true,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
