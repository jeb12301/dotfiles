require('user.plugins')

require('user.nvim-tree')

require('user.lualine')
-- Use pyenv python

vim.cmd.let("g:python3_host_prog=$HOME.'/.pyenv/shims/python3'")

-- Setting up nvim 
vim.cmd.set("number")                     -- Show current line number
vim.cmd.set("relativenumber")             -- Show relative line numbers

-- Line number colors
vim.cmd("highlight LineNr ctermfg=grey ctermbg=white")	

-- Centers when using k, j, and G
vim.cmd("nnoremap k kzz")
vim.cmd("nnoremap j jzz")
vim.cmd("nnoremap G Gzz")

-- Centers for ctrl + b and ctrl + f
-- vim.cmd("nnoremap <C-f> <C-f>zz")
-- vim.cmd("nnoremap <C-b> <C-b>zz")

-- copy to clipboard
vim.cmd("set mouse+=a")
vim.cmd("set clipboard+=unnamedplus")

vim.cmd("filetype plugin indent on")

vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

vim.cmd("syntax enable")

vim.cmd("let g:vimtex_view_method = 'zathura_simple'")

vim.cmd("let g:vimtex_compiler_method = 'latexmk'")


-- auto-delete compile files, does not work well with multi file latex
vim.cmd([[
augroup vimtex_config
  autocmd!
  autocmd User VimtexQuit call vimtex#latexmk#clean(0)
augroup END
]])

vim.cmd("let g:deoplete#enable_at_startup = 1")

vim.cmd("nmap <localleader>c <Plug>(vimtex-compile)")
vim.cmd("nmap <localleader>r <Plug>(vimtex-clean)")
vim.cmd("nmap <localleader>v <plug>(vimtex-view)")
vim.cmd("nmap <localleader>e <plug>(vimtex-errors)")



-- press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")

-- -1 for jumping backwards.

vim.cmd("inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>")

vim.cmd("snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>")
vim.cmd("snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>")


require('user.config')



-- luasnip config for tab and shift-tab
-- Expand or jump in insert mode
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'") 

-- Jump forward through tabstops in visual mode
vim.cmd("map <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'")

-- Jump backward through snippet tabstops with Shift-Tab (for example)
vim.cmd("imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'")
vim.cmd("smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'")


require('user.keymaps')


vim.cmd("set background=light")
