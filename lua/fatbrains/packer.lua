local cmd = vim.cmd
local packerpresent, packer = pcall(require, 'packer')
local first_install = false

if (not packerpresent) then
  local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  print('Cloning packer..')
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '1',
    packer_path,
  })
  cmd('packadd packer.nvim')
  packerpresent, packer = pcall(require, 'packer')
  if (packerpresent) then
    print('Packer cloned successfully.')
    first_install = true
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. '\n' .. packer)
  end
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
    prompt_border = 'rounded',
  },
  git = {
    clone_timeout = 800, -- Timeout, in seconds, for git clones
  },
  compile_path = vim.fn.stdpath('config') .. '/lua/fatbrains/compiled.lua',
  snapshot_path = vim.fn.stdpath('config') .. '/snapshots',
  auto_clean = true,
  compile_on_sync = true,
})

return {
  packer = packer,
  first_install = first_install,
}
