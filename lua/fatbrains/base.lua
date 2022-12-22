vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.termguicolors = true

vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.lazyredraw = true
vim.opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
vim.opt.list = true
vim.opt.listchars = {
  tab = '❘-',
  trail = '·',
  lead = ' ',
  extends = '»',
  precedes = '«',
  nbsp = '×',
}
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.sidescrolloff = 3
vim.opt.signcolumn = 'yes'
vim.opt.splitbelow = true -- Open new split below
vim.opt.splitright = true -- Open new split to the right

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.backupskip = '/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true

vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = '\e[4:3m']])
vim.cmd([[let &t_Ce = '\e[4:0m']])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

vim.opt.formatoptions:append { 'r' }
