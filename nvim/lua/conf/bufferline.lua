local buffer_status,bufferline = pcall(require,'bufferline')
if not buffer_status then 
	return 
end

vim.opt.termguicolors = true
bufferline.setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
