local buffer_status,bufferline = pcall(require,'bufferline')
if not buffer_status then 
	return 
end

vim.opt.termguicolors = true
options = {
		close_command = "bdelete! %d",       -- 点击关闭按钮关闭
		right_mouse_command = "bdelete! %d", -- 右键点击关闭
		indicator = {
			icon = '▎', -- 分割线
			style = 'underline',
		},
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer" ,
				text_align = "left",
				separator = true,
			}
		},
}
bufferline.setup {
    options = options

}
