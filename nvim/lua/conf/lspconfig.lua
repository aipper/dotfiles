local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end
local sage_ok, lsp_sage = pcall(require, "lspsage")
if not sage_ok then
	return
end
lsp_sage.setup({
	finder = {
		max_height = 0.6,
		keys = {
			vsplit = "v",
		},
	},
})

local handler_status, handler = pcall(require, "conf.mason.handler")
if not handler_status then
	return
end

local servers = {
	"docker_compose_language_service",
	"lua_ls",
	"gopls",
	"pyright",
	"rust_analyzer",
	"volar",
	"ts_ls",
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = handler.on_attach,
		capabilities = handler.capabilities,
	}
	if server == "volar" then
		opts.filetypes = { "vue" }
		-- ... 保留现有的 volar 配置 ...
	elseif server == "ts_ls" then
		opts.filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" }
		opts.root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
		opts.cmd = { "typescript-language-server", "--stdio" } -- 确保使用正确的命令
	end

	local has_custom_opts, server_custom_opts = pcall(require, "conf.mason." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
})

local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
