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

  -- vimtex
  use 'lervag/vimtex'

  -- deoplete
  use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'}
  use 'deoplete-plugins/deoplete-tag'
  use {'deathlyfrantic/deoplete-spell', branch = 'main'}

  -- luasnip
  use({'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*'})

  -- nvim-tree
  use ({'nvim-tree/nvim-tree.lua', requires = {
    'nvim-tree/nvim-web-devicons'}})

  -- gruvbox
  use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }

  -- lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

  -- telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

  if install_plugins then
    require('packer').sync()
  end
end)


if install_plugins then
  return
end

