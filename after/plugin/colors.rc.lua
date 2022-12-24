local colorstatus, tnight = pcall(require, "tokyonight")
if not colorstatus then
  return
end

tnight.setup({
  style = "storm",
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },
})

vim.cmd([[colorscheme tokyonight-night]])
vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
