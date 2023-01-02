vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- project view with Ex
vim.keymap.set("n", "x", '"_x') -- don't yank with x
vim.keymap.set("n", "+", "<C-a>") -- increments number under cursor
vim.keymap.set("n", "-", "<C-x>") -- decrements number under cursor
vim.keymap.set("n", "dw", 'vb"_d') -- delete word backwards

vim.keymap.set("n", "te", ":tabedit<Return>", { silent = true }) -- new tab
vim.keymap.set("n", "zs", ":split<Return><C-w>w", { silent = true }) -- horizontal split
vim.keymap.set("n", "zv", ":vsplit<Return><C-w>w", { silent = true }) -- vertical split
vim.keymap.set("n", "<leader><leader>", "<C-w>w") -- cycle through
vim.keymap.set("n", "z<up>", "<C-w>k") -- focus up
vim.keymap.set("n", "z<right>", "<C-w>l") -- focus right
vim.keymap.set("n", "z<down>", "<C-w>j") -- focus down
vim.keymap.set("n", "z<left>", "<C-w>h") -- focus left
vim.keymap.set("n", "zk", "<C-w>k") -- focus up
vim.keymap.set("n", "zl", "<C-w>l") -- focus right
vim.keymap.set("n", "zj", "<C-w>j") -- focus down
vim.keymap.set("n", "zh", "<C-w>h") -- focus left
vim.keymap.set("n", "zc", "<C-w>c") -- close focused

vim.keymap.set("n", "<C-w><left>", "<C-w><") -- resize left
vim.keymap.set("n", "<C-w><right>", "<C-w>>") -- resize right
vim.keymap.set("n", "<C-w><up>", "<C-w>+") -- resize up
vim.keymap.set("n", "<C-w><down>", "<C-w>-") -- resize down

vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeToggle<cr>") -- toggle tree
vim.keymap.set("n", "<F7>", '<cmd>:echo expand("%:p")<cr>') -- show full buffer path

vim.keymap.set("n", "J", "mzJ`z") -- pull line below to the end of current one
vim.keymap.set("x", "<leader>p", '"_dP') -- paste over selection keeping current yank

vim.keymap.set("n", "<C-a>", "gg<S-v>G") -- select all
vim.keymap.set("n", "<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace

vim.keymap.set("n", "<C-\\>", "<cmd>:w<cr>:ToggleTerm<cr>")
vim.keymap.set("i", "<C-\\>", "<esc><cmd>:w<cr>:ToggleTerm<cr>")
vim.keymap.set("t", "<C-\\>", [[<C-\><C-n><cmd>:ToggleTerm<cr>]])
vim.keymap.set("t", "<C-z><up>", [[<C-\><C-n><C-w>k]])
vim.keymap.set("t", "<C-z><right>", [[<C-\><C-n><C-w>l]])
vim.keymap.set("t", "<C-z><down>", [[<C-\><C-n><C-w>j]])
vim.keymap.set("t", "<C-z><left>", [[<C-\><C-n><C-w>h]])

if vim.fn.has("macunix") then
  vim.keymap.set("v", "<M-Up>", ":m '<-2<cr>gv=gv") -- move selecttion up
  vim.keymap.set("v", "<M-Down>", ":m '>+1<cr>gv=gv") -- move selection down
  vim.keymap.set("n", "<M-Up>", "<C-u>zz") -- scroll up keeping cursor centered
  vim.keymap.set("n", "<M-Down>", "<C-d>zz") -- scroll down keeping cursor centered
else
  vim.keymap.set("v", "<C-Up>", ":m '<-2<cr>gv=gv") -- move selecttion up
  vim.keymap.set("v", "<C-Down>", ":m '>+1<cr>gv=gv") -- move selection down
  vim.keymap.set("n", "<C-Up>", "<C-u>zz") -- scroll up keeping cursor centered
  vim.keymap.set("n", "<C-Down>", "<C-d>zz") -- scroll down keeping cursor centered
end

vim.keymap.set("n", "Q", "<nop>") -- Q is bad
vim.keymap.set("i", "<S-End>", "<esc>vg_y<cmd>:echo 'yanked'<CR>")
vim.keymap.set("n", "<S-End>", "vg_y<cmd>:echo 'yanked'<CR>")

vim.api.nvim_command([[augroup highlight_current_word]])
vim.api.nvim_command([[au!]])
vim.api.nvim_command([[au CursorHold * :exec 'match Search /\V\<' . expand('<cword>') . '\>/']])
vim.api.nvim_command([[augroup END]])
vim.api.nvim_command([[:set updatetime=500]])
