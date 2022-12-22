local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd("normal vbd")
          end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
          ["<CR>"] = actions.select_tab,
          ["v"] = actions.select_vertical,
          ["s"] = actions.select_horizontal,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")

local defaultopts = { no_ignore = false, hidden = true }
local bufferdiropts = {
  path = "%:p:h",
  cwd = telescope_buffer_dir(),
  respect_gitignore = false,
  hidden = false,
  grouped = true,
  previewer = false,
  initial_mode = "normal",
  layout_config = { height = 30 },
}
local fb = telescope.extensions.file_browser.file_browser
local gs = builtin.grep_string

vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files(defaultopts)
end)
vim.keymap.set("n", "<leader>fg", function()
  builtin.live_grep()
end)
vim.keymap.set("n", "<leader>fb", function()
  builtin.buffers()
end)
vim.keymap.set("n", "<leader>ft", function()
  builtin.help_tags()
end)
vim.keymap.set("n", "<leader>fr", function()
  builtin.resume()
end)
vim.keymap.set("n", "<leader>fe", function()
  builtin.diagnostics()
end)
vim.keymap.set("n", "<leader>fs", function()
  gs({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fd", function()
  fb(bufferdiropts)
end)
