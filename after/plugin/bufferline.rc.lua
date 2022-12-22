local bufferlinestatus, bufferline = pcall(require, "bufferline")
if not bufferlinestatus then
  return
end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_line = "padded_slant",
    separator_style = "padded",
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "right",
        separator = true,
      },
    },
  },
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
