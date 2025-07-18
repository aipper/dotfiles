local map = vim.api.nvim_set_keymap

local opt = {noremap = true, silent = true }

map("","<Space>","<Nop>",opt)
vim.g.mapleader= " "
vim.g.maplocalleader = " "
vim.cmd[[
  let g:mapleader = ' '
  let g:maplocalleader = ' '
]]

map("n", '<S-e>', ":NvimTreeToggle<CR>", opt)
map("n", '<leader>w', "<C-w>", opt)
-- telescope 
map('n','<leader>ff', ':Telescope fd<cr>' ,{})
map('n','<leader>fg', ':Telescope live_grep<cr>' ,{})
map('n','<leader>fb', ':Telescope buffers<cr>' ,{})
map('n','<leader>gs', ':Telescope git_status<cr>' ,{})
map('n','<leader>km', ':Telescope keymaps<cr>' ,{})
map('n','<leader>td',':TodoTelescope<cr>',opt)
--map('n','<leader>ff',[[<cmd>lua require('telescope.builtin').find_files()<cr>]],{})
--map('n','<leader>fg',[[<cmd>lua require('telescope.builtin').live_grep()<cr>]],{})
--map('n','<leader>fb',[[<cmd>lua require('telescope.builtin').buffers()<cr>]],{})
--map('n','<leader>fh',[[<cmd>lua require('telescope.builtin').help_tags()<cr>]],{})
--map('n','<leader>sf',[[<cmd>lua require('telescope.builtin').file_browser()<cr>]],{})
--map('n','<leader>/',[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]],{})


--map('n','<leader>e',':Lex 30<cr>',opt)



-- insert
map('i','jk','<ESC>',opt)

-- 添加这行来查看通知历史
map('n', '<leader>nh', '<cmd>lua require("notify").history()<CR>', opt)

map('n', '<leader>nl', '<cmd>lua require("notify").last()<CR>', opt)

map('n', '<leader>fn', '<cmd>Telescope notify<CR>', opt)


local function is_lazy_buffer()
    return vim.bo.filetype =='lazy'
end

vim.keymap.set('n','q',function()
    if is_lazy_buffer() then
        vim.cmd('close')
    else
        vim.cmd('NvimTreeClose')
    end
end, {silent=true}
)
