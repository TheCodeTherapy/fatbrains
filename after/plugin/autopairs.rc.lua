local autopairsstatus, autopairs = pcall(require, 'nvim-autopairs')
if (not autopairsstatus) then return end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    java = false,
  },
  disable_filetype = { 'TelescopePrompt', 'vim' },
  fast_wrap = {},
})


local cmpstatus, cmp = pcall(require, 'cmp')
if (not cmpstatus) then return end

local cmpautopairsstatus, cmpautopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if (not cmpautopairsstatus) then return end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
