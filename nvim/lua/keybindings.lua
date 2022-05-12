
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map("","<Space>","<Nop>",opt)
vim.g.mapleader= " "
vim.g.maplocalleader = " "
map("n", '<S-e>', ":NvimTreeToggle<CR>", opt)
-- telescope 
map('n','<leader>ff',[[<cmd>lua require('telescope.builtin').find_files()<cr>]],{})
map('n','<leader>fg',[[<cmd>lua require('telescope.builtin').live_grep()<cr>]],{})
map('n','<leader>fb',[[<cmd>lua require('telescope.builtin').buffers()<cr>]],{})
map('n','<leader>fh',[[<cmd>lua require('telescope.builtin').help_tags()<cr>]],{})
map('n','<leader>sf',[[<cmd>lua require('telescope.builtin').file_browser()<cr>]],{})
map('n','<leader>/',[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]],{})

