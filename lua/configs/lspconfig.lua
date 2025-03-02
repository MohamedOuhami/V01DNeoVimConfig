-- Load NvChad's default LSP configurations
require("nvchad.configs.lspconfig").defaults()

-- Import LSP config module
local lspconfig = require "lspconfig"

-- Define the list of LSP servers to configure
local servers = { "html", "cssls", "ts_ls", "jsonls", "gopls", "tailwindcss", "pyright" }

-- Import NvChad's LSP configurations
local nvlsp = require "nvchad.configs.lspconfig"

-- Configure LSP servers with default settings
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,    -- Use NvChad's on_attach function
    on_init = nvlsp.on_init,        -- Use NvChad's on_init function
    capabilities = nvlsp.capabilities, -- Use NvChad's capabilities
  }
end

-- Add JDTLS specific configuration
local jdtls_config = require "custom.configs.jdtls"
lspconfig.jdtls.setup(vim.tbl_deep_extend("force", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}, jdtls_config or {}))

-- Add custom configuration for pyright
lspconfig.pyright.setup(vim.tbl_deep_extend("force", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}, {
  settings = {
    python = {
      pythonPath = "/home/v01d/miniconda3/envs/jobScraper/bin/python",
    },
  },
}))
