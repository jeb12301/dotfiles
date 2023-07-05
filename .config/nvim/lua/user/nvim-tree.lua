-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    number = false,
    relativenumber = false,
  }, 
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  hijack_cursor = true,
})

-- `m`               Toggle Bookmark         |nvim-tree-api.marks.toggle()|
-- `>`               Next Sibling            |nvim-tree-api.node.navigate.sibling.next()|
-- `<`               Previous Sibling        |nvim-tree-api.node.navigate.sibling.prev()|
-- `a`               Create                  |nvim-tree-api.fs.create()|
-- `d`               Delete                  |nvim-tree-api.fs.remove()|
-- `f`               Filter                  |nvim-tree-api.live_filter.start()|
-- 'W' collapse
-- 'E' expand
-- https://docs.rockylinux.org/books/nvchad/nvchad_ui/nvimtree/
