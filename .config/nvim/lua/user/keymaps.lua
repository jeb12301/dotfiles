vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- nvim-tree
vim.cmd("nnoremap <C-n> :NvimTreeToggle<CR>")
vim.cmd("nnoremap <leader>r :NvimTreeRefresh<CR>")
vim.cmd("nnoremap <leader>n :NvimTreeFindFile<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
