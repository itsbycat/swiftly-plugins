AddEventHandler("OnRoundStart", function(event)
    gameRules = GetCCSGameRules()

    map = server:GetMap()
    totalPlayers = playermanager:GetPlayerCount()
    maxPlayers = server:GetMaxPlayers()
    round = gameRules.TotalRoundsPlayed

    playermanager:SendMsg(
        MessageType.Chat,
        FetchTranslation("RoundInfo.msg"):gsub("{MAP_NAME}", map):gsub("{CURRENT_ROUND}", round):gsub("{ONLINE_PLAYER_COUNT}", totalPlayers):gsub("{MAX_PLAYER_COUNT}", maxPlayers)
    )

    return EventResult.Continue
end)
