local configuration = {
    GetPluginAuthor = "ByCat",
    GetPluginVersion = "1.0.0",
    GetPluginName = "Round Information",
    GetPluginWebsite = "https://bycat.one"
}

for key, value in pairs(configuration) do _G[key] = function() return value end end
