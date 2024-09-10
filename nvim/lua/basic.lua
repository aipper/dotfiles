-- utf8
vim.g.encoding = 'utf-8'
vim.g.fileencoding = 'utf-8'


-- jk移动光标上下方保留行数
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true

-- 高亮所在行
vim.wo.cursorline = true

-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"


vim.opt.clipboard = "unnamedplus"

-- 新行对齐当前行，空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- always show tabline
vim.o.showtabline = 2
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth=4
vim.o.shiftround = true
--命令行高度设置
vim.o.cmdheight = 4
vim.opt.fileformats = "unix,dos"

