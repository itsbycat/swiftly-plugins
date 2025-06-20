AddEventHandler("OnClientProcessUsercmds", function(event, playerid, cmds, numcmds, paused, margin)
    local player = GetPlayer(playerid)

    if not player or not player:IsValid() then return end

    for i=1,numcmds do
        if cmds[i]:HasField("base") then
            local baseusermessagepb = cmds[i]:GetMessage("base")
            if baseusermessagepb:HasField("viewangles") then
                local viewAngles = baseusermessagepb:GetQAngle("viewangles")
            
                if viewAngles.x > 360 or viewAngles.x < -360 then
                    ReplyToCommand(
                        playerid,
                        "[HvH]",
                        "You have been killed due to exploit."
                    )
            
                    player:Kill()
                    return
                end
            end
        end
    end

    return EventResult.Continue
end)
