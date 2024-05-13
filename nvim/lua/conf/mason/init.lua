
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end
require('conf.mason.luals')
require('conf.mason.gopls')


require('conf.mason.handler').setup()

local servers =  {'docker_compose_language_service','lua_ls','gopls','pyright','rust-analyzer'}
require('mason-lspconfig').setup({
    ensure_installed=servers,
    automatic_installation = true,
    handlers =nil
})

for  _,server  in pairs(servers) do
    local opts = {
		on_attach = require("conf.mason.handler").on_attach,
		capabilities = require("conf.mason.handler").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "conf.mason." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
