local notify_status ,notify  = pcall(require,'notiry')
if not notify_status then
    return
end

vim.o.notify = notify
