local webdeviconsstatus, webdevicons = pcall(require, 'nvim-web-devicons')
if (not webdeviconsstatus) then return end

webdevicons.setup {
  override = {},
  default = true
}
