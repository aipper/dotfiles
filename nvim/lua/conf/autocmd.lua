vim.cmd([[
    augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
    augroup END
]])
vim.cmd([[
  let g:auto_save = 1
  let g:auto_save_events = ['InsertLeave','TextChanged']
]])

vim.cmd("colorscheme tokyonight")
