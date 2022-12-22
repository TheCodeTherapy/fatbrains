vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Don't yank with x
vim.keymap.set('n', 'x', '"_x')

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Delete word backwards
vim.keymap.set('n', 'dw', 'vb"_d')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
vim.keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
vim.keymap.set('n', 'zs', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', 'zv', ':vsplit<Return><C-w>w', { silent = true })

-- Navigate through windows
vim.keymap.set('n', '<Space>', '<C-w>w') -- cycle through
vim.keymap.set('n', 'z<up>', '<C-w>k') -- focus up
vim.keymap.set('n', 'z<right>', '<C-w>l') -- focus right
vim.keymap.set('n', 'z<down>', '<C-w>j') -- focus down
vim.keymap.set('n', 'z<left>', '<C-w>h') -- focus left
vim.keymap.set('n', 'zk', '<C-w>k') -- focus up
vim.keymap.set('n', 'zl', '<C-w>l') -- focus right
vim.keymap.set('n', 'zj', '<C-w>j') -- focus down
vim.keymap.set('n', 'zh', '<C-w>h') -- focus left
vim.keymap.set('n', 'zc', '<C-w>c') -- close focused

-- Resize window
vim.keymap.set('n', '<C-w><left>', '<C-w><')
vim.keymap.set('n', '<C-w><right>', '<C-w>>')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')

-- Reload configs
vim.keymap.set('n', '<C-R>', '<cmd>:so<cr>')

-- Toggle nvim-tree
vim.keymap.set('n', '<leader>e', '<cmd>:NvimTreeToggle<cr>')
vim.keymap.set('n', '<F7>', '<cmd>:echo expand("%:p")<cr>')

-- Move stuff
vim.keymap.set("v", "<C-Up>", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "<C-Down>", ":m '>+1<cr>gv=gv")
vim.keymap.set('n', '<C-Up>', '<C-u>zz')
vim.keymap.set('n', '<C-Down>', '<C-d>zz')
vim.keymap.set('n', 'J', 'mzJ`z')

-- Sane paste and replaces
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<C-r>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Hatred
vim.keymap.set('n', 'Q', '<nop>')

