local notify_status, notify = pcall(require, "notify")
if not notify_status then
	print("Failed to load nvim-notify")
	return
end

local function my_render(bufnr, notif, highlights)
	-- 自定义渲染逻辑
end

notify.setup({
	-- Animation style (see below for details)
	stages = "fade_in_slide_out",

	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,

	-- Function called when a window is closed
	on_close = nil,

	-- Render function for notifications. See notify-render()

	-- Default timeout for notifications
	timeout = 3000,

	-- Max number of columns for messages
	max_width = nil,
	-- Max number of lines for a message
	max_height = nil,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
	background_colour = "Normal",

	-- Minimum width for notification windows
	minimum_width = 50,

	-- Icons for the different levels
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

vim.notify = notify

-- 修改这部分代码
local path = vim.fn.stdpath("data") .. "/notify_history.json"

-- 检查文件是否存在
if vim.fn.filereadable(path) == 1 then
	-- 如果文件存在，加载历史记录
	local history = vim.fn.json_decode(vim.fn.readfile(path))
	for _, notif in ipairs(history) do
		notify(notif.message, notif.level, notif.opts)
	end
end

-- 在退出时保存历史记录
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local history = notify.history()
		if history then
			vim.fn.writefile({ vim.fn.json_encode(history) }, path)
		end
	end,
})

-- 在文件末尾添加
local telescope_status, telescope = pcall(require, "telescope")
if telescope_status then
	telescope.load_extension("notify")
end

-- 在文件末尾添加
notify.last = function()
	local history = notify.history()
	if #history > 0 then
		local last_notification = history[#history]
		vim.notify(last_notification.message, last_notification.level, last_notification.opts)
	else
		vim.notify("No notifications", vim.log.levels.INFO)
	end
end
