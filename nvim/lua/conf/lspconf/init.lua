local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end
local lspInstallStatus ,lspInstall  = pcall(require,'nvim-lsp-installer')
if  not  lspInstallStatus then
    return
end

require('conf.lspconf.handler').setup()


local  servers  = {'gopls','lua_ls',"volar","java_language_server","kotlin_language_server","pylsp","tailwindcss","tsserver","rust_analyzer"}

lspInstall.setup({
    ensure_installed =  servers,
    automatic_installation = true,
})

for  _,server  in pairs(servers) do
    local opts = {
		on_attach = require("conf.lspconf.handler").on_attach,
		capabilities = require("conf.lspconf.handler").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "conf.lspconf." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end



