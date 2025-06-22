local configuration = {
    GetPluginAuthor = "ByCat",
    GetPluginVersion = "1.0.1",
    GetPluginName = "Teleport Fix",
    GetPluginWebsite = "https://bycat.one"
}

for key, value in pairs(configuration) do _G[key] = function() return value end end
