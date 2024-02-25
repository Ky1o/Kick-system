RegisterNetEvent("Kick-System:kickPlayer")
AddEventHandler("Kick-System:kickPlayer", function(target, reason)
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
end)