local function GetNonFakePlayers()
    local ret, activeClients = 0, playermanager:GetPlayerCap()

    if activeClients == 0 then return ret end

    for i = 0, activeClients do
        player = GetPlayer(i)
        if player and not player:IsFakeClient() then
            ret = ret + 1
        end
    end

    return ret
end

AddEventHandler("OnRoundStart", function(event)
    gameRules = GetCCSGameRules()

    map = server:GetMap()
    totalPlayers = GetNonFakePlayers()
    maxPlayers = server:GetMaxPlayers()
    round = gameRules.TotalRoundsPlayed

    if totalPlayers == 0 then return end

    playermanager:SendMsg(
        MessageType.Chat,
        FetchTranslation("RoundInfo.msg"):gsub("{MAP_NAME}", map):gsub("{CURRENT_ROUND}", round):gsub("{ONLINE_PLAYER_COUNT}", totalPlayers):gsub("{MAX_PLAYER_COUNT}", maxPlayers)
    )

    return EventResult.Continue
end)
