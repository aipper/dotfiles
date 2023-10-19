require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local servers =  {'docker_compose_language_service','lua_ls','jdtls' ,'gopls'}
require('mason-lspconfig').setup({
    ensure_installed=servers,
    automatic_installation = true,
    handlers =nil
})


     
