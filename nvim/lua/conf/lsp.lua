--local lsp = require('lspconfig')
local lsp_status,lsp = pcall(require,'lspconfig')
if not lsp_status then
	return 
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end
local cmp_vim_lsp_status,cmp_lsp = pcall(require,'cmp_nvim_lsp')
if not cmp_vim_lsp_status then 
	return 
end
local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- setup languages
-- GoLang
lsp['gopls'].setup{
  cmd = {'gopls'},
  on_attach = on_attach,
  capabilities =  capabilities,
  sttings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true
      },
      staticcheck = true
    },
    init_options = {
      usePlaceholders = true
    }
  }
}


