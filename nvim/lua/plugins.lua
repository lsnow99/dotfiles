local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  use 'neovim/nvim-lspconfig'

  use 'onsails/lspkind.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }

 use  'lewis6991/gitsigns.nvim'

 use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

 use 'Mofiqul/vscode.nvim'
  use {
      "hrsh7th/nvim-cmp",
      requires = {
          "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
          'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
          'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
      }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-tree/nvim-web-devicons'
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

  use 'jose-elias-alvarez/typescript.nvim'

  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'


  use "IndianBoy42/tree-sitter-just"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

