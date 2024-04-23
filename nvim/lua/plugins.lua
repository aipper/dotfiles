local fn = vim.fn
local install_path = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(install_path) then
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


require('lazy').setup({
  {'wbthomason/packer.nvim'},
--   {williamboman/nvim-lsp-installer'
  {'neovim/nvim-lspconfig'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},

  -- buffer栏插件
  {'akinsho/bufferline.nvim', version  = "v2.*", dependencies = 'kyazdani42/nvim-web-devicons'},
  -- 补全插件
  {"hrsh7th/nvim-cmp"},

  -- 补全源
  {"hrsh7th/cmp-vsnip"},
  {"hrsh7th/cmp-nvim-lsp"},-- { name = nvim_lsp }
  {"hrsh7th/cmp-buffer"}, -- { name = 'buffer' },
  {"hrsh7th/cmp-path"}, -- { name = 'path' }
  {"hrsh7th/cmp-cmdline"}, -- { name = 'cmdline' }
  {"hrsh7th/cmp-nvim-lsp-signature-help"}, -- { name = 'nvim_lsp_signature_help' }
  {'onsails/lspkind-nvim'},
  {
  'David-Kunz/cmp-npm',
  dependencies = {
    'nvim-lua/plenary.nvim'
    }
  },
  -- LuaSnip
  {'L3MON4D3/LuaSnip'},
  {'saadparwaiz1/cmp_luasnip'},

  --  lua增强
  {"folke/lua-dev.nvim"},

  -- onedark 主题
  {'navarasu/onedark.nvim'},

  -- vim-tree
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
  },

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'vim-airline/vim-airline'},
  {'vim-airline/vim-airline-themes'},
  {'preservim/tagbar'},

  -- 开屏页面
  {'mhinz/vim-startify'},

   -- go 插件
  {'fatih/vim-go' ,build =':GoInstallBinaries'},
  {'tpope/vim-commentary'},
  {'tpope/vim-surround'},
  {'jiangmiao/auto-pairs'},

-- git 插件
  -- {f-person/git-blame.nvim'
  -- {kdheepak/lazygit.nvim'
  {'lewis6991/gitsigns.nvim',version = 'release'},


-- autosave
  {'907th/vim-auto-save'},
  {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  -- terminal
  --
  {
    'akinsho/toggleterm.nvim',version = 'v2.*',config = function()
      require('toggleterm').init()
    end
  },
  {
    'ojroques/nvim-lspfuzzy',
    dependencies = {
        {'junegunn/fzf'},
        {'junegunn/fzf.vim'},  -- to enable preview (optional)
    },
  },
  -- notify
  {'rcarriga/nvim-notify'},
  -- css color
  {'norcalli/nvim-colorizer.lua' },
  --  todo
  {
      'folke/todo-comments.nvim',
        dependencies = "nvim-lua/plenary.nvim",
  },
  --  断点调试
  {'mfussenegger/nvim-dap'},
  {'theHamsta/nvim-dap-virtual-text'},
  {'rcarriga/nvim-dap-ui'},
  {'ray-x/lsp_signature.nvim'},
  -- js
  {'leafgarland/typescript-vim'},
  {'peitalin/vim-jsx-typescript'},

  --  格式化
  {'prettier/vim-prettier'},
})
