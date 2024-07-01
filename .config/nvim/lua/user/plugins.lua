-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Use :PackerSync and :PackerInstall to update packages


local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- deoplete
  use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'}
  use 'deoplete-plugins/deoplete-tag'
  use {'deathlyfrantic/deoplete-spell', branch = 'main'}

  -- vimtex
  use 'lervag/vimtex'

  -- luasnip
  use({'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*'})

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- papercolor
  use 'NLKNguyen/papercolor-theme'
  
  -- gruvbox
  -- use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }

  -- lualie
  use {
  'nvim-lualine/lualine.nvim',
 requires = { 'nvim-tree/nvim-web-devicons', opt = true },
}

  -- telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

  -- vim-be-good
  use 'ThePrimeagen/vim-be-good'

  -- nerdtree
  -- use 'preservim/nerdtree'

  -- lean.nvim
  use 'Julian/lean.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

  -- hyprland syntax
  use {
    'theRealCarneiro/hyprland-vim-syntax',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    }, ft = 'hypr',
  }

  if install_plugins then
    require('packer').sync()
  end
end)


if install_plugins then
  return
end

