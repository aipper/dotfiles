vim.g.mapleader= " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

map("n", '<S-e>', ":NvimTreeToggle<CR>", opt)

