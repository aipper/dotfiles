
--local lsp = require('lspconfig')
local lsp_status,lsp = pcall(require,'lspconfig')
local cmd = vim.api.nvim_command
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
local util = require('lspconfig/util')
-- setup languages
-- GoLang
lsp.gopls.setup{
  cmd = {'gopls','serve'},
  on_attach = on_attach,
  filetypes = {'go','gomod','gotmpl'},
  root_dir = util.root_pattern('go.work','go.mod','.git'),
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

function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end

cmd('autocmd BufWritePre *.go lua OrgImports(1000)')
