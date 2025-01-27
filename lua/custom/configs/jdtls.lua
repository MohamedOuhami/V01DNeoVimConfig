local config = {
  cmd = {
    'jdtls',
    '--jvm-arg=-javaagent:/home/v01d/.local/share/nvim/mason/packages/jdtls/lombok.jar', -- Update this path
    '-configuration', '/home/v01d/.local/share/nvim/mason/packages/jdtls/config_linux',   -- Update this path
    '-data', vim.fn.expand('~/.cache/jdtls-workspace'),
  },
  -- Java settings
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17", -- Update this to your Java version
            path = "/home/v01d/.sdkman/candidates/java/current",  -- Update this path
          },
        },
      },
      -- Enable Lombok support
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      -- Enable annotation processing
      compiler = {
        annotationProcessing = {
          enabled = true,
        },
      },
    },
  },
}

return config
