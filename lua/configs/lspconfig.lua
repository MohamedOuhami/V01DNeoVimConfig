-- Update your lspconfig.lua:
require("nvchad.configs.lspconfig").defaults()
require("java").setup()
local lspconfig = require "lspconfig"

local servers = { "html", "cssls","ts_ls",'json-lsp','gopls' }  -- Remove jdtls from here since we're configuring it separately
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Add JDTLS specific configuration
local jdtls_config = require("custom.configs.jdtls")
lspconfig.jdtls.setup(vim.tbl_extend("force", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}, jdtls_config))
