local status, npairs = pcall(require, "nvim-autopairs")
if not status then
  return
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt" },
  fast_wrap = {
    map = "<M-w>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
})

local cmpstatus, cmp = pcall(require, "cmp")
if not cmpstatus then
  return
end

local cmpautopairsstatus, cmpnpairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmpautopairsstatus then
  return
end

cmp.event:on("confirm_done", cmpnpairs.on_confirm_done({ map_char = { tex = "" } }))
