AddEventHandler("OnClientProcessUsercmds", function(event, playerid, cmds, numcmds, paused, margin)
    local player = GetPlayer(playerid)

    if not player or not player:IsValid() then return end

    local pawn = player:CCSPlayerPawnBase()

    if not pawn then return end

    local viewAngles = pawn.EyeAngles

    if not viewAngles then return end

    if viewAngles.x > 89 or viewAngles.x < -89 then
        ReplyToCommand(
            playerid,
            "[HvH]",
            "You have been killed due to exploit."
        )

        player:Kill()
    end

    return EventResult.Continue
end)
