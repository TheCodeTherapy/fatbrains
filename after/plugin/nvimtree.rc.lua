vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local nvimtreestatus, nvimtree = pcall(require, "nvim-tree")
if not nvimtreestatus then
  return
end

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = "W", action = "collapse_all" }, -- collapse all tree
        { key = "E", action = "expand_all" }, -- expand all tree
        { key = "<C-k>", action = "toggle_file_info" }, -- file info
        { key = "a", action = "create" }, -- create file
        { key = "d", action = "remove" }, -- delete file
        { key = "<C-v>", action = "vsplit" }, -- open in vertical split
        { key = "<C-x>", action = "split" }, -- open in horizontal split
        { key = "<C-t>", action = "tabnew" }, -- open in new tab
        { key = "-", action = "dir_up" },
        { key = "s", action = "system_open" },
        { key = "f", action = "live_filter" },
        { key = "F", action = "clear_live_filter" },
        { key = "q", action = "close" },
        { key = "S", action = "search_node" },
        { key = ".", action = "run_file_command" },
        { key = "g?", action = "toggle_help" },
        { key = "<C-r>", action = "full_rename" },
        { key = "e", action = "rename_basename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "D", action = "trash" },
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        { key = "<C-e>", action = "edit_in_place" },
        { key = "O", action = "edit_no_picker" },
        { key = { "<C-]>", "<2-RightMouse>" }, action = "cd" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = "<BS>", action = "close_node" },
        { key = "<Tab>", action = "preview" },
        { key = "K", action = "first_sibling" },
        { key = "J", action = "last_sibling" },
        { key = "C", action = "toggle_git_clean" },
        { key = "I", action = "toggle_git_ignored" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "B", action = "toggle_no_buffer" },
        { key = "U", action = "toggle_custom" },
        { key = "R", action = "refresh" },
        { key = "r", action = "rename" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "[e", action = "prev_diag_item" },
        { key = "[c", action = "prev_git_item" },
        { key = "]e", action = "next_diag_item" },
        { key = "]c", action = "next_git_item" },
        { key = "m", action = "toggle_mark" },
        { key = "bmv", action = "bulk_move" },
      },
    },
  },
  renderer = {
    group_empty = false,
    add_trailing = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 1,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    exclude = {},
  },
  remove_keymaps = { "s" },
})

local function tab_win_closed(winnr)
  local api = require("nvim-tree.api")
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w)
    return w ~= winnr
  end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then
    if not vim.tbl_isempty(tab_bufs) then
      api.tree.close()
    end
  else
    if #tab_bufs == 1 then
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then
        vim.schedule(function()
          if #vim.api.nvim_list_wins() == 1 then
            vim.cmd("quit")
          else
            vim.api.nvim_win_close(tab_wins[1], true)
          end
        end)
      end
    end
  end
end

vim.api.nvim_create_autocmd("WinClosed", {
  callback = function()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(tab_win_closed(winnr))
  end,
  nested = true,
})
