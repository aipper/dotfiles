
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
    local opts = { noremap=true, silent=true }

    -- 设置 normal 模式下的快捷键
    -- 第一个参数 n 表示 normal 模式
    -- 第二个参数表示按键
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    -- 跳转到定义或者声明的地方
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    -- 查看接口的所有实现
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    -- 查看所有引用当前对象的地方
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    -- 跳转到下一个/上一个语法错误
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
    buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    -- 手工触发格式化
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
    -- 列出所有语法错误列表
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)
    -- 修改当前符号的名字
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
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
local  opts = {
  cmd = {'gopls'},
  on_attach = on_attach,
  filetypes = {'go','gomod','gotmpl'},
  -- root_dir = util.root_pattern('go.work','go.mod','.git'),
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
return opts

-- function OrgImports(wait_ms)
--     local params = vim.lsp.util.make_range_params()
--     params.context = {only = {"source.organizeImports"}}
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--     for _, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.edit then
--           vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
--         else
--           vim.lsp.buf.execute_command(r.command)
--         end
--       end
--     end
--   end

-- cmd('autocmd BufWritePre *.go lua OrgImports(1000)')
