
function kickPlayer(target, reason)
    local targetPlayer = tonumber(target)

    if targetPlayer == source then
        lib.notify(source, {title = "Can't kick yourself.", type = 'error'})
    else
        if targetPlayer and GetPlayerName(targetPlayer) then
            DropPlayer(targetPlayer, "Kicked: " .. reason)
            lib.notify(source, {title = GetPlayerName(targetPlayer) .. ' was kicked succesfully.', type = 'success'})
        else
            lib.notify(source, {title = 'Player is not online.', type = 'error'})
        end
    end
end

RegisterCommand("kick",function()
    local input = lib.inputDialog(source, 'Kick', {'ID', 'Reason'})
    Citizen.Wait(1500)
    local alert = lib.alertDialog(source, {
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
