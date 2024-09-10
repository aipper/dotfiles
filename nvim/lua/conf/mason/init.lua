local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

mason.setup()

local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status then
	return
end

local servers = {
	'docker_compose_language_service',
	'lua_ls',
	'gopls',
	'pyright',
	'rust_analyzer',
	'volar',
	'typescript-language-server'  -- 使用完整的名称以确保正确安装
}

mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

print("Mason-lspconfig setup complete")
for _, server in ipairs(servers) do
	local server_name = server == 'typescript-language-server' and 'ts_ls' or server
	local server_available, _ = pcall(require, "lspconfig." .. server_name)
	if server_available then
		print(server .. " is available")
	else
		print(server .. " is not available")
	end
end