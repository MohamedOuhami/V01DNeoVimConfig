
-- Load default configurations
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Example: list of servers to configure
local servers = { "html", "cssls", "ts_ls" }  -- You can add more servers here
local jdtls = require("lspconfig").jdtls

-- Set up Java LSP (jdtls)
jdtls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Configure other LSPs with the default settings
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
