local treesitterstatus, ts = pcall(require, 'nvim-treesitter.configs')
if (not treesitterstatus) then
  print('nvim-treesitter not installed. Please run :PackerInstall')
  return
else
  ts.setup {
    ensure_installed = { 'help', 'vim', 'c', 'lua', 'rust', 'json', 'css', 'javascript', 'typescript' },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    indent = {
      enable = true,
      disable = {}
    },
    highlight = {
      enable = true,
      disable = {},
      disable = function(lang, buf)
        local max_filesize = 100 * 16384 -- ~1600 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
  }
end

