--local telescope = require('telescope')
local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	return
end

telescope.setup({
	defaults = {},
	extensions = {},
})

pcall(telescope.load_extension, "notify")
