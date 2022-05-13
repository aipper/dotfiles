local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1", -- "https://github.com/wbthomason/packer.nvim",
    "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup({function()
  use 'wbthomason/packer.nvim'
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'

 -- use 'preservim/nerdtree'

  -- buffer栏插件
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  
  -- 补全插件
  use("hrsh7th/nvim-cmp")

  -- 补全源
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
  use('onsails/lspkind-nvim')
  use {
  'David-Kunz/cmp-npm',
  requires = {
    'nvim-lua/plenary.nvim'
    }
  }
  
  -- LuaSnip
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  --  lua增强
  use("folke/lua-dev.nvim")

  -- onedark 主题
  use('navarasu/onedark.nvim')

  -- vim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'vim-airline/vim-airline'}
  use {'vim-airline/vim-airline-themes'}
  use 'preservim/tagbar'

  -- 开屏页面
  use 'mhinz/vim-startify'

   -- go 插件
  use 'fatih/vim-go'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'jiangmiao/auto-pairs'

-- git 插件
  -- use 'f-person/git-blame.nvim'
  -- use 'kdheepak/lazygit.nvim'
  use  {'lewis6991/gitsigns.nvim',tag = 'release'}


-- autosave 
  use '907th/vim-auto-save'
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
  -- terminal
  --
  use {
    'akinsho/toggleterm.nvim',tag = 'v1.*',config = function()
      require('toggleterm').setup()
    end
  }
  use {
    'ojroques/nvim-lspfuzzy',
    requires = {
        {'junegunn/fzf'},
        {'junegunn/fzf.vim'},  -- to enable preview (optional)
    },
  }
  -- notify
  use 'rcarriga/nvim-notify'
  -- css color
  use {'norcalli/nvim-colorizer.lua' }
  --  todo 
  use {
      'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim",
  }

end,
config={
  git = {
      default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
  }
}
})
