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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server", -- Tailwind CSS LSP
        "typescript-language-server", -- TypeScript LSP
        "eslint_d", -- ESLint for linting
        "prettierd", -- Prettier for formatting
      },
    },
  },
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await", -- Required dependency
      "nvim-java/nvim-java-core", -- Required dependency
      "nvim-java/nvim-java-test", -- Required dependency
      "nvim-java/nvim-java-dap", -- Required dependency
      "nvim-java/nvim-java-refactor", -- Required for refactoring
      "MunifTanjim/nui.nvim", -- Required dependency
      "neovim/nvim-lspconfig", -- LSP support
      "mfussenegger/nvim-dap", -- Debug Adapter Protocol
      "williamboman/mason.nvim", -- Mason for LSP installation
    },
  },
  {
    "windwp/nvim-ts-autotag", -- Auto-close and auto-rename HTML/JSX tags
    ft = { "javascript", "typescript", "jsx", "tsx" },
  },
  {
    "jose-elias-alvarez/null-ls.nvim", -- For formatting and linting
    config = function()
      require("null-ls").setup {
        sources = {
          require("null-ls").builtins.formatting.prettierd, -- Prettier for formatting
          require("null-ls").builtins.diagnostics.eslint_d, -- ESLint for linting
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path", -- Path source for nvim-cmp
      "hrsh7th/cmp-cmdline", -- Command line source for nvim-cmp
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    },
  },
  {
    "L3MON4D3/LuaSnip", -- Snippet engine
    dependencies = {
      "rafamadriz/friendly-snippets", -- Predefined snippets
    },
  },
  {
    "mattn/emmet-vim", -- Emmet for HTML snippets
    ft = { "html", "javascript", "typescript", "jsx", "tsx", "css" }, -- Enable for TSX and other file types
    config = function()
      -- Configure Emmet for TSX files
      vim.g.user_emmet_settings = {
        typescript = {
          extends = "jsx", -- Enable Emmet for JSX/TSX
        },
      }
      vim.g.user_emmet_mode = "i" -- Enable Emmet in insert mode
      vim.g.user_emmet_install_global = 0 -- Disable global Emmet installation
      vim.cmd [[autocmd FileType html,css,javascript,typescript,jsx,tsx EmmetInstall]] -- Install Emmet for specific file types
    end,
  },
}
