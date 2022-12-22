local colorstatus = pcall(require, "tokyonight")
if not colorstatus then
  return
end

vim.cmd([[colorscheme tokyonight-night]])
