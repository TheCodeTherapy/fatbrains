local colorstatus = pcall(require, 'tokyonight')
if (not colorstatus) then return end

vim.cmd[[colorscheme tokyonight-night]]
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- local colorstatus, colors = pcall(require, 'vscode')
-- if (not colorstatus) then return end
-- local c = require('vscode.colors')

-- colors.setup({
--   transparent = false,
--   italic_comments = false,
--   disable_nvimtree_bg = true,
--   -- Override colors (see ./lua/vscode/colors.lua)
--   color_overrides = {
--     vscLineNumber = '#424240',
--   },
--   group_overrides = {
--     -- this supports the same val table as vim.api.nvim_set_hl
--     -- use colors from this colorscheme by requiring vscode.colors!
--     Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
--   }
-- })
