function kickPlayer(target, reason)
    TriggerServerEvent("Kick-System:kickPlayer", target, reason)
end

RegisterCommand("kick",function()
    local input = lib.inputDialog('Kick', {'ID', 'Reason'})
    Citizen.Wait(1500)
    local alert = lib.alertDialog({
        header = '# Alert #',
        content = 'Are you sure you want to kick a player with the ID: ' .. input[1] .. ' ?',
        centered = true,
        cancel = true,
        labels = {
            cancel = "No",
            confirm = "Yes"
        }
    })
    if alert == "confirm" then
        kickPlayer(input[1], input[2])
    elseif alert == "cancel" then
        lib.notify({title = 'Canceled.', type = 'error'})
    end
end)
