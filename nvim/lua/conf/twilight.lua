local ok, twilight = pcall(require, "twilight")
if not ok then
	return
end
twilight.setup({
	-- 配置选项
	dimming = {
		alpha = 0.7, -- 背景变暗的程度
		color = { "#404040" }, -- 背景颜色
		term_bg = "#000000", -- 终端背景颜色
		inactive = false, -- 是否在非活动窗口中应用
	},
	context = 10, -- 保留的上下文行数
	treesitter = true, -- 使用 treesitter 解析器
	expand = { "function", "method", "table", "if_statement" }, -- 展开的语法结构
})
