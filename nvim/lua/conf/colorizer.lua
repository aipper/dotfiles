local  color_status,colorizer  = pcall(require,'colorizer')  
if not  color_status then
    return 
end


colorizer.setup({
    '*';
    css = {rgb_fn = true};
    html = {names = false}
})
