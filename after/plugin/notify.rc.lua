local notifystatus, notify = pcall(require, "notify")
if not notifystatus then
  return
end

notify.setup({
  background_colour = "#000000",
})
