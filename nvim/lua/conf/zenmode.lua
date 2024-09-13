local status, zenmode = pcall(require, "zen-mode")
if not status then
	return
end
local opt = {}
zenmode.toggle(opt)
