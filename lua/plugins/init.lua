return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'williamboman/mason.nvim',
    },
  },
}
