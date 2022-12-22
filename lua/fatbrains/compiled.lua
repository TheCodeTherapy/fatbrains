-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/marcogomez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/marcogomez/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/marcogomez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/marcogomez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/marcogomez/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/thecodetherapy/LuaSnip"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/thecodetherapy/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/thecodetherapy/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/thecodetherapy/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/thecodetherapy/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/thecodetherapy/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/thecodetherapy/cmp_luasnip"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/thecodetherapy/gitsigns.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/thecodetherapy/lsp-zero.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/thecodetherapy/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/thecodetherapy/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/thecodetherapy/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/thecodetherapy/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/thecodetherapy/mason.nvim"
  },
  ["null-ls.nvim"] = {
    after = { "prettier.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/thecodetherapy/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/thecodetherapy/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/thecodetherapy/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/thecodetherapy/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/thecodetherapy/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/thecodetherapy/nvim-treesitter"
  },
  ["nvim-treesitter-playground"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-treesitter-playground",
    url = "https://github.com/thecodetherapy/nvim-treesitter-playground"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/thecodetherapy/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/thecodetherapy/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/thecodetherapy/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/thecodetherapy/plenary.nvim"
  },
  ["prettier.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/opt/prettier.nvim",
    url = "https://github.com/thecodetherapy/prettier.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/thecodetherapy/telescope-file-browser.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/thecodetherapy/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/marcogomez/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/thecodetherapy/tokyonight.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\5\0\b\0\f6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\6\0006\3\0\0009\3\4\0039\3\5\3B\3\1\2=\3\a\2B\0\2\1K\0\1\0\nbufnr\1\0\0\25nvim_get_current_buf\bapi\vformat\bbuf\blsp\bvimY\0\0\4\2\a\0\v6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\2-\3\1\0=\3\6\2B\0\2\1K\0\1\0\1À\2\0\nasync\nbufnr\1\0\0\vformat\bbuf\blsp\bviml\0\0\5\0\b\0\f6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\6\0006\3\0\0009\3\4\0039\3\5\3B\3\1\2=\3\a\2B\0\2\1K\0\1\0\nbufnr\1\0\0\25nvim_get_current_buf\bapi\vformat\bbuf\blsp\bvimÂ\3\1\2\b\3\22\00019\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\28€6\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0003\6\a\0005\a\b\0=\1\t\aB\2\5\0016\2\2\0009\2\n\0029\2\v\0025\4\f\0=\1\t\4-\5\0\0=\5\r\4B\2\2\0016\2\2\0009\2\n\0029\2\14\2-\4\1\0005\5\15\0=\1\t\5-\6\0\0=\6\r\0053\6\16\0=\6\17\5B\2\3\0019\2\0\0'\4\18\0B\2\2\2\15\0\2\0X\3\t€6\2\2\0009\2\3\0029\2\4\2'\4\19\0'\5\6\0003\6\20\0005\a\21\0=\1\t\aB\2\5\0012\0\0€K\0\1\0\0À\1À\2À\1\0\1\tdesc\17[lsp] format\0\6x!textDocument/rangeFormatting\rcallback\0\1\0\1\tdesc\25[lsp] format on save\24nvim_create_autocmd\ngroup\1\0\0\24nvim_clear_autocmds\bapi\vbuffer\1\0\1\tdesc\17[lsp] format\0\14<Leader>p\6n\bset\vkeymap\bvim\28textDocument/formatting\20supports_methodÕ\1\1\0\a\0\r\0\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\2'\1\5\0\6\1\6\0X\2\2€+\2\1\0X\3\1€+\2\2\0006\3\a\0'\5\b\0B\3\2\0029\3\t\0035\5\v\0003\6\n\0=\6\f\5B\3\2\0012\0\0€K\0\1\0\14on_attach\1\0\0\0\nsetup\fnull-ls\frequire\17bufwritepost\16bufwritepre\1\0\1\nclear\1\23lsp_format_on_save\24nvim_create_augroup\bapi\bvim\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-ts-autotag ]]
vim.cmd [[ packadd lsp-zero.nvim ]]
vim.cmd [[ packadd prettier.nvim ]]
time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
