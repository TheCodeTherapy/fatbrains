local fatbrains_packer = require("fatbrains.packer")
local packer = fatbrains_packer.packer
local use = packer.use

return packer.startup(function()
  use("thecodetherapy/packer.nvim")

  use({
    "thecodetherapy/telescope.nvim",
    requires = {
      { "thecodetherapy/plenary.nvim" },
      { "thecodetherapy/telescope-file-browser.nvim" },
    },
  })

  use({
    "thecodetherapy/null-ls.nvim",
    requires = {
      { "thecodetherapy/plenary.nvim" },
    },
    config = function()
      require("null-ls").setup()
    end,
  })

  use({
    "thecodetherapy/tokyonight.nvim",
  })

  use({
    "thecodetherapy/bufferline.nvim",
    requires = {
      { "thecodetherapy/nvim-web-devicons" },
    },
  })

  use({
    "thecodetherapy/lualine.nvim",
    requires = {
      "thecodetherapy/nvim-web-devicons",
      out = true,
    },
  })

  use({
    "thecodetherapy/nvim-tree.lua",
    requires = {
      "thecodetherapy/nvim-web-devicons",
    },
  })

  use({
    "thecodetherapy/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use({
    "thecodetherapy/nvim-ts-rainbow",
  })

  use({
    "thecodetherapy/nvim-treesitter-playground",
    requires = {
      { "thecodetherapy/nvim-treesitter" },
    },
  })

  use({
    "thecodetherapy/lsp-zero.nvim",
    requires = {
      { "thecodetherapy/mason.nvim" },
      { "thecodetherapy/nvim-lspconfig" },
      { "thecodetherapy/mason-lspconfig.nvim" },
      { "thecodetherapy/nvim-cmp" },
      { "thecodetherapy/cmp-buffer" },
      { "thecodetherapy/cmp-path" },
      { "thecodetherapy/cmp-nvim-lsp" },
      { "thecodetherapy/cmp-nvim-lua" },
      { "thecodetherapy/cmp_luasnip" },
      { "thecodetherapy/LuaSnip" },
      { "thecodetherapy/lspkind.nvim" },
      { "thecodetherapy/lspsaga.nvim" },
    },
  })

  use({
    "thecodetherapy/prettier.nvim",
    after = {
      "lsp-zero.nvim",
      "null-ls.nvim",
    },
  })

  use({
    "thecodetherapy/nvim-ts-autotag",
    after = "nvim-treesitter",
  })

  use({
    "thecodetherapy/nvim-autopairs",
  })

  use({
    "thecodetherapy/nvim-notify",
  })

  use({
    "thecodetherapy/gitsigns.nvim",
  })

  if fatbrains_packer.first_install then
    packer.install()
  end
end)
