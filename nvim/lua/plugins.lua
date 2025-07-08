local fn = vim.fn
local install_path = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(install_path) then
	vim.notify("正在安装lazy.nvim，请稍后...")
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		install_path,
	})
end

vim.opt.rtp:prepend(install_path)

require("lazy").setup({
	--	{ "wbthomason/packer.nvim" },
	--   {williamboman/nvim-lsp-installer'
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- buffer栏插件
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	-- 补全插件
	{ "hrsh7th/nvim-cmp" },

	-- 补全源
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-nvim-lsp" }, -- { name = nvim_lsp }
	{ "hrsh7th/cmp-buffer" }, -- { name = 'buffer' },
	{ "hrsh7th/cmp-path" }, -- { name = 'path' }
	{ "hrsh7th/cmp-cmdline" }, -- { name = 'cmdline' }
	{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- { name = 'nvim_lsp_signature_help' }
	{ "onsails/lspkind-nvim" },
	{
		"David-Kunz/cmp-npm",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- LuaSnip
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },

	--  lua增强
	{ "folke/lua-dev.nvim" },

	-- onedark 主题
	--{ "navarasu/onedark.nvim" },

	-- vim-tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
	},

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "p00f/nvim-ts-rainbow" },
	{ "windwp/nvim-autopairs" },
	--	{ "vim-airline/vim-airline" },
	--	{ "vim-airline/vim-airline-themes" },
	{ "preservim/tagbar" },

	-- 开屏页面
	{ "mhinz/vim-startify" },

	-- go 插件
	{ "fatih/vim-go", build = ":GoInstallBinaries" },
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{ "jiangmiao/auto-pairs" },

	-- git 插件
	-- {f-person/git-blame.nvim'
	-- {kdheepak/lazygit.nvim'
	-- {'lewis6991/gitsigns.nvim',version = 'release'},
	{ "kdheepak/lazygit.nvim" },

	-- autosave
	{ "907th/vim-auto-save" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- terminal
	--
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
	},
	{
		"ojroques/nvim-lspfuzzy",
		dependencies = {
			{ "junegunn/fzf" },
			{ "junegunn/fzf.vim" }, -- to enable preview (optional)
		},
	},
	-- notify
	{ "rcarriga/nvim-notify" },
	-- css color
	{ "norcalli/nvim-colorizer.lua" },
	--  todo
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	--  断点调试
	{ "mfussenegger/nvim-dap" },
	-- {'puremourning/vimspector'},
	{ "mfussenegger/nvim-jdtls" },
	{ "theHamsta/nvim-dap-virtual-text" },
	{ "rcarriga/nvim-dap-ui" },
	{ "ray-x/lsp_signature.nvim" },
	-- js
	{ "leafgarland/typescript-vim" },
	{ "peitalin/vim-jsx-typescript" },

	--  格式化
	{ "prettier/vim-prettier" },
	-- rust
	-- {'simrat39/rust-tools.nvim'},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- null-ls 替代
	{ "nvimtools/none-ls.nvim" },
	{ "sbdchd/neoformat" },
	-- lsp 增强
	{ "nvimdev/lspsaga.nvim" },
	-- 主题
	--	{
	--		"scottmckendry/cyberdream.nvim",
	--		lazy = false,
	--		priority = 1000,
	--	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
  -- popup
  {"nvim-lua/popup.nvim"},
  {"nvim-lua/plenary.nvim"},
  {"j-hui/fidget.nvim"},
{
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("crates").setup()
  end,
},
{
  "simrat39/inlay-hints.nvim",
  config = function()
    require("inlay-hints").setup()
  end,
},
{
  "stevearc/oil.nvim",
  opts = {},
  -- 可以映射快捷键，例如:
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
  },
},

{
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
},
{
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
},
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- 配置选项
    })
  end,
},
{
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup()
  end,
},
{
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup()
  end,
},
{
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
},
{
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rouge8/neotest-rust",  -- Rust 支持
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rust"),
      },
    })
  end,
},
{"lewis6991/impatient.nvim"},
{
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup()
    vim.keymap.set("n", "<C-i>", '<cmd>lua require("FTerm").toggle()<CR>', { desc = "Toggle Terminal" })
    vim.keymap.set("t", "<C-i>", '<C-\\><C-n><cmd>lua require("FTerm").toggle()<CR>', { desc = "Toggle Terminal" })
  end,
}

})
