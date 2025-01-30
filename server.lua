-- ███████╗██╗███████╗██╗  ██╗ ██████╗███████╗
-- ██╔════╝██║██╔════╝██║ ██╔╝██╔════╝██╔════╝
-- █████╗  ██║███████╗█████╔╝ ██║     █████╗  
-- ██╔══╝  ██║╚════██║██╔═██╗ ██║     ██╔══╝  
-- ██║     ██║███████║██║  ██╗╚██████╗███████╗
-- ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚══════╝
-- Created By Fiskce [REDACTED]

-- } license = [REDACTED]
-- } support = [REDACTED]


--//=======================================================================================
--//                 Author:  @fiskce / @IcezDK	 	  Date: 10/12/2020                      
--//=======================================================================================
--//                                    serverscript                  	    
--//                                 Fiskce Anti Cheat                           
--//                             									                                        
--//=======================================================================================

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

local validResourceList

local function collectValidResourceList()
	validResourceList = {}
	for i=0,GetNumResources()-1 do
    	validResourceList[GetResourceByFindIndex(i)] = true
  	end
end

collectValidResourceList()
AddEventHandler("onResourceListRefresh", collectValidResourceList)
RegisterNetEvent("Pl:CmR")
AddEventHandler("Pl:CmR", function(givenList)
  for _, resource in ipairs(givenList) do
    if not validResourceList[resource] then
        TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
        FiskceAntiCheatLog(source, "Tried to inject a resource that is not listed","basic")
      break
    end
  end
end)

AddEventHandler("RemoveAllPedWeaponsEvent", function(source)
    CancelEvent()
    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
    FiskceAntiCheatLog(source, "Tried to remove weapons from player","basic")
end)

-- AddEventHandler("RemoveAllPedWeapons", function(source)
--     CancelEvent()
--     TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
--     FiskceAntiCheatLog(source, "Tried to remove weapons from player","basic")
-- end)

--local Text               = {}
local BanList            = {}
local BanListLoad        = false
CreateThread(function()
        while true do
                Wait(1000)
        if BanListLoad == false then
                        loadBanList()
                        if BanList ~= {} then
                                --
                                BanListLoad = true
                        else
                                --
                        end
                end
        end
end)

AddEventHandler("ShootSingleBulletBetweenCoordsEvent", function(source)
    CancelEvent()
    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
    FiskceAntiCheatLog(source, "Tried to taze a player","basic")
end)

AddEventHandler("ShootSingleBulletBetweenEvent", function(source, data)
    if data.coords then
        CancelEvent()
        TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
        FiskceAntiCheatLog(source, "tried to taze a player","basic")
    end
end)

-- AddEventHandler("ResetPlayerStamina", function(source)
--     CancelEvent()
--     TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
--     FiskceAntiCheatLog(source, "tried to taze a player","basic")
-- end)

AddEventHandler("SetSuperJumpThisFrame", function(source)
    CancelEvent()
    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
    FiskceAntiCheatLog(source, "tried to taze a player","basic")
end)

AddEventHandler("AddAmmoToPedEvent", function(source, data)
    if data.ByType then
        CancelEvent()
        TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
        FiskceAntiCheatLog(source, "tried to taze a player","basic")
    end
end)

AddEventHandler("ShootSingleBulletBetweenCoords", function(source)
    CancelEvent()
    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
    FiskceAntiCheatLog(source, "Tried to taze a player","basic")
end)

CreateThread(function()
        while true do
                Wait(600000)
        if BanListLoad == true then
                        loadBanList()
                end
        end
end)

RegisterServerEvent('aopkfgebjzhfpazf77')
AddEventHandler('aopkfgebjzhfpazf77', function(reason,servertarget)
        local license,identifier,liveid,xblid,discord,playerip,target
        local duree     = 1
        local reason    = reason

        if not reason then reason = "Auto Anti-Cheat" end

        if tostring(source) == "" then
                target = tonumber(servertarget)
        else
                target = source
        end

        if target and target >= 1 then
                local ping = GetPlayerPing(target)

                if ping and ping > 1 then
                        if duree and duree < 365 then
                                local sourceplayername = "FiskceAntiCheat"
                                local targetplayername = GetPlayerName(target)
                                        for k,v in ipairs(GetPlayerIdentifiers(target))do
                                                if string.sub(v, 1, string.len("license:")) == "license:" then
                                                        license = v
                                                elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
                                                        identifier = v
                                                elseif string.sub(v, 1, string.len("live:")) == "live:" then
                                                        liveid = v
                                                elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                                                        xblid  = v
                                                elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                                                        discord = v
                                                elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                                                        playerip = v
                                                end
                                        end

                                if duree > 1 then
                                        ban(target,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,1)
                                        DropPlayer(target, "〈🐱‍👤〉 FiskceAntiCheat: ".. reason)
                                else
                                        ban(target,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,1)
                                        DropPlayer(target, "〈🐱‍👤〉 FiskceAntiCheat: ".. reason)
                                end

                        else
                                --print("Error")
                        end
                else
                        --print("BanSql Error : Auto-Cheat-Ban target are not online.")
                end
        else
                --print("BanSql Error : Auto-Cheat-Ban have recive invalid id.")
        end
end)

AddEventHandler('playerConnecting', function (playerName,setKickReason)
        local license,steamID,liveid,xblid,discord,playerip  = "n/a","n/a","n/a","n/a","n/a","n/a"

        for k,v in ipairs(GetPlayerIdentifiers(source))do
                if string.sub(v, 1, string.len("license:")) == "license:" then
                        license = v
                elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
                        steamID = v
                elseif string.sub(v, 1, string.len("live:")) == "live:" then
                        liveid = v
                elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                        xblid  = v
                elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                        discord = v
                elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                        playerip = v
                end
        end

        if (Banlist == {}) then
                Citizen.Wait(1000)
        end


        for i = 1, #BanList, 1 do
                if
                          ((tostring(BanList[i].license)) == tostring(license)
                        or (tostring(BanList[i].identifier)) == tostring(steamID)
                        or (tostring(BanList[i].liveid)) == tostring(liveid)
                        or (tostring(BanList[i].xblid)) == tostring(xblid)
                        or (tostring(BanList[i].discord)) == tostring(discord)
                        or (tostring(BanList[i].playerip)) == tostring(playerip))
                then

                        if (tonumber(BanList[i].permanent)) == 1 then
                                setKickReason("〈🐱‍👤〉 FiskceAntiCheat: "..ConfigACC.BanReason)
                CancelEvent()
                break
                        end
                end
        end
end)

function ban(source,license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,duree,reason,permanent)
        local expiration = duree * 84000
        local timeat     = os.time()
        local added      = os.date()

        if expiration < os.time() then
                expiration = os.time()+expiration
        end

                table.insert(BanList, {
                        license    = license,
                        identifier = identifier,
                        liveid     = liveid,
                        xblid      = xblid,
                        discord    = discord,
                        playerip   = playerip,
                        reason     = reason,
                        expiration = expiration,
                        permanent  = permanent
          })

                MySQL.Async.execute(
                'INSERT INTO FiskceAntiCheat_bans (license,identifier,liveid,xblid,discord,playerip,targetplayername,sourceplayername,reason,expiration,timeat,permanent) VALUES (@license,@identifier,@liveid,@xblid,@discord,@playerip,@targetplayername,@sourceplayername,@reason,@expiration,@timeat,@permanent)',
                {
                                ['@license']          = license,
                                ['@identifier']       = identifier,
                                ['@liveid']           = liveid,
                                ['@xblid']            = xblid,
                                ['@discord']          = discord,
                                ['@playerip']         = playerip,
                                ['@targetplayername'] = targetplayername,
                                ['@sourceplayername'] = sourceplayername,
                                ['@reason']           = reason,
                                ['@expiration']       = expiration,
                                ['@timeat']           = timeat,
                                ['@permanent']        = permanent,
                                },
                                function ()
                end)
                BanListHistoryLoad = true
end

function loadBanList()
        MySQL.Async.fetchAll(
                'SELECT * FROM FiskceAntiCheat_bans',
                {},
                function (data)
                  BanList = {}

                  for i=1, #data, 1 do
                        table.insert(BanList, {
                                license    = data[i].license,
                                identifier = data[i].identifier,
                                liveid     = data[i].liveid,
                                xblid      = data[i].xblid,
                                discord    = data[i].discord,
                                playerip   = data[i].playerip,
                                reason     = data[i].reason,
                                expiration = data[i].expiration,
                                permanent  = data[i].permanent
                          })
                  end
    end)
end

RegisterCommand("unban", function(source, args, raw)
                cmdunban(source, args)
end)

function cmdunban(source, args)
    if args[1] then
        local target = table.concat(args, " ")
        MySQL.Async.fetchAll('SELECT * FROM banlist WHERE targetplayername like @playername', {
            ['@playername'] = ("%"..target.."%")
        }, function(data)
            if data[1] then
                if #data > 1 then
                else
                    MySQL.Async.execute('DELETE FROM banlist WHERE targetplayername = @name', {
                        ['@name']  = data[1].targetplayername
                    }, function ()
                        loadBanList()
                        TriggerClientEvent('chat:addMessage', source, { args = { '^1Banlist ', data[1].targetplayername.." was unban from FiskceAntiCheat" } } )
                    end)
                end
            else
            end
        end)
    else
    end
end

local newestversion = "v12.1 [BETA]"
local versionac = ConfigACC.Version

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

-- Login message

Citizen.CreateThread(function()
    print([[

    ^4                                 
    ^4       _______      __             ___   ______
    ^4      / ____(_)____/ /__________  /   | / ____/
    ^4     / /_  / / ___/ //_/ ___/ _ \/ /| |/ /     
    ^4    / __/ / (__  ) ,< / /__/  __/ ___ / /___   
    ^4   /_/   /_/____/_/|_|\___/\___/_/  |_\____/   
    ^4   
    ^1By Beriffa & Fiskce [Redistribution is not allowed]
       

    ^0        if any issues contact fiskce#2102 
    ^0 or find help here https://beriffa.com/help-center

    
    ^0       [^3Server Status^0]^9:^2 Online / Functional                                                     

]])
    ACStarted()
end)

--

function nullfieldcheck()
    if ConfigACC.LogWebhook == "" then
        print("^3[FiskceAntiCheat] ^7 ^4ConfigACC.LogWebhook ^7: ^1MISSING or is NULL ^7!")
        print("^3[FiskceAntiCheat] ^7 ^1Stopping Anticheat...")
        Wait(10000)
        os.exit()
    elseif ConfigACC.Version == "" or ConfigACC.Version == nil then
        print("^3[FiskceAntiCheat] ^7 ^4ConfigACC.Version ^7: ^1MISSING or is NULL ^7!")
        print("^3[FiskceAntiCheat] ^7 ^1Stopping Anticheat...")
        Wait(10000)
        os.exit()
    else
        return true
    end
end

--=====================================================--

if ConfigACC.EjerToolBan then
RegisterServerEvent('RunCode:RunStringRemotelly')
AddEventHandler('RunCode:RunStringRemotelly', function()
    FiskceAntiCheatLog(source, "Ejer Tool","basic")
    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Ejer Tool", source)
    CancelEvent()
    end)
end

--=====================================================--

if ConfigACC.AntiAdminAbuse then
    RegisterNetEvent('murtaza:fix')
    AddEventHandler('murtaza:fix', function()
        CancelEvent()
        DropPlayer("🐱‍👤 "..ConfigACC.AntiAdminAbuseKickMessage)
    end)
end

--=====================================================--

if ConfigACC.AntiAdminAbuse then
    RegisterNetEvent('fix')
    AddEventHandler('fix', function()
        CancelEvent()
        DropPlayer("🐱‍👤 "..ConfigACC.AntiAdminAbuseKickMessage)
    end)
end

--=====================================================--

if ConfigACC.AntiAdminAbuse then
    RegisterNetEvent('staff.revive')
    AddEventHandler('staff.revive', function()
        CancelEvent()
        DropPlayer("🐱‍👤 "..ConfigACC.AntiAdminAbuseKickMessage)
    end)
end

--=====================================================--
  -- DENNE ER LIGEGYLDIG NU 2021
-- if ConfigACC.ShootAtDetection then
--     AddEventHandler("shootEvent", function(source, data)
--         if data.at then
--             CancelEvent()
--             TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
--             FiskceAntiCheatLog(source, "ShootAt","basic")
--         end
--     end)
-- end

--=====================================================--

local function V(Q, W, X)
	local Y = GetPlayerIdentifiers(source)
	local v = false;
	local A = tostring(GetPlayerEndpoint(source))
	if ConfigACC.GlobalBan then
		if glubol ~= nil then
			local Z = json.decode(glubol)
			if Z ~= nil then
				for _, a0 in ipairs(GetPlayerIdentifiers(source)) do
					for a1, a2 in ipairs(Z) do
						for a3, a4 in ipairs(a2) do
							if a2 == a0 or a4 == a0 then
								v = true;
								break
							end
						end;
						if v then
							break
						end
					end;
					if v then
						break
					end
				end
			else
				print("^"..math.random(1, 9).."FiskceAntiCheat^0: ^Global Ban Check for ^0"..GetPlayerName(source).." ^failed...^0")
			end;
			if v then
				print("^"..math.random(1, 9).."FiskceAntiCheat^0: ^3Player "..GetPlayerName(source).." Global banned!...^0")
				PerformHttpRequest("", function(E, F, G)
				end, "POST", json.encode({
					embeds = {
						{
							author = {
								name = "FiskceAntiCheat",
								url = "",
								icon_url = ""
							},
							title = "Global Ban "..GetPlayerName(source).." "..b,
							description = GetPlayerName(source).." "..tostring(json.encode(GetPlayerIdentifiers(source))),
							color = 1769216
						}
					}
				}), {
					["Content-Type"] = "application/json"
				})
				PerformHttpRequest(c, function(E, F, G)
				end, "POST", json.encode({
					embeds = {
						{
							author = {
								name = "FiskceAntiCheat",
								url = "",
								icon_url = ""
							},
							title = "FiskceAntiCheat Global Ban",
							description = "**"..GetPlayerName(source).."** is a Global Banned Player, and was trying to join your server",
							color = 16745963
						}
					}
				}), {
					["Content-Type"] = "application/json"
				})
				GlobalBan(source)
				return
			end
		end
	end;
	local o = LoadResourceFile(GetCurrentResourceName(), "GBans.json")
	if o ~= nil then
		local p = json.decode(o)
		if type(p) == "table" then
			for _, a0 in ipairs(GetPlayerIdentifiers(source)) do
				for m, n in ipairs(p) do
					for a5, a6 in ipairs(n) do
						if a6 == a0 or n == a0 then
							v = true;
							break
						end
					end;
					if v then
						break
					end
				end;
				if v then
					break
				end
			end;
			if v then
				print("^"..math.random(1, 9).."FiskceAntiCheat^0: ^1Player "..GetPlayerName(source).." banned...^0")
				GlobalBan(source)
				X.done("🐱‍👤 FiskceAntiCheat Global Banned: You're banned from all servers protected by FiskceAntiCheat https://discord.gg/EwtEeJD2jc")
				return
			end
		else
			FiskceAntiCheatbanlistregenerator()
		end
	else
		FiskceAntiCheatbanlistregenerator()
	end
end;

--=====================================================--

function FiskceAntiCheatbanlistregenerator()
    local o = LoadResourceFile(GetCurrentResourceName(), "GBans.json")
    if not o or o == "" then
        SaveResourceFile(GetCurrentResourceName(), "GBans.json", "[]", -1)
        print("^"..math.random(1, 9).."FiskceAntiCheat^0: ^3Warning! ^0Your ^1GBans.json ^0is missing, Regenerating your ^1GBans.json ^0file!")
    else
        local p = json.decode(o)
        if not p then
            SaveResourceFile(GetCurrentResourceName(), "GBans.json", "[]", -1)
            p = {}
            print("^"..math.random(1, 9).."FiskceAntiCheat^0: ^3Warning! ^0Your ^1GBans.json ^0is corrupted, Regenerating your ^1GBans.json ^0file!")
        end
    end
end;

--=====================================================--

function GlobalBan(source)
    local o = LoadResourceFile(GetCurrentResourceName(), "GBans.json")
    if o ~= nil then
        local q = json.decode(o)
        if type(q) == "table" then
            table.insert(q, GetPlayerIdentifiers(source))
            local r = json.encode(q)
            DropPlayer(source, "〈🐱‍👤〉 FiskceAntiCheat Global Banned: you have been banned from all servers protected by FiskceAntiCheat ")
            SaveResourceFile(GetCurrentResourceName(), "GBans.json", r, -1)
        else
            FiskceAntiCheatbanlistregenerator()
        end
    else
        FiskceAntiCheatbanlistregenerator()
    end
end;


if ConfigACC.ForceDiscord then
local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local discordIdentifier
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()
  
    Wait(0)
  
    for _, v in pairs(identifiers) do
        if string.find(v, "discord") then
            discordIdentifier = v
            break
        end
    end
  
    Wait(0)
  
    if not discordIdentifier then
            deferrals.done("🐱‍👤 " .. ConfigACC.ForceDiscordMessage)
                if ConfigACC.ForceDiscordConsoleLogs then
                    print("^6ForceDiscord^0 " .. name .. " ^3Rejected for not using discord.")
                end
        else
            deferrals.done()
        end
     end
end
  
  AddEventHandler("playerConnecting", OnPlayerConnecting)

--=====================================================--

if ConfigACC.ForceSteam then
local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()
  
    Wait(0)
  
    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end
  
    Wait(0)
  
    if not steamIdentifier then
            deferrals.done("🐱‍👤 " .. ConfigACC.ForceSteamMessage)
                if ConfigACC.ForceSteamConsoleLogs then
                    print("^9ForceSteam^0 " .. name .. " ^7Rejected for not using steam.")
                end
        else
            deferrals.done()
        end
     end
end
  
  AddEventHandler("playerConnecting", OnPlayerConnecting)

--=====================================================--

if ConfigACC.ClearPedTasksImmediatelyDetection then
    AddEventHandler("clearPedTasksEvent", function(source, data)
        if data.immediately then
            CancelEvent()
            TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Function", source)
            FiskceAntiCheatLog(source, "ClearPedTasksImmediately","basic")
        end
    end)
end

--=====================================================--

FiskceAntiCheatLog = function(playerId, reason, typee)
    playerId = tonumber(playerId)
    local name = GetPlayerName(playerId)
    if playerId == 0 then
        local name = "YOU HAVE TRIGGERED A BLACKLISTED TRIGGER"
        local reason = "YOU HAVE TRIGGERED A BLACKLISTED TRIGGER"
    else
    end
    local steamid = "Unknown"
    local license = "Unknown"
    local discord = "Unknown"
    local xbl = "Unknown"
    local liveid = "Unknown"
    local ip = "Unknown"

    if name == nil then
        name = "Unknown"
    end

    for k, v in pairs(GetPlayerIdentifiers(playerId)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = string.sub(v, 4)
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(v, 9)
            discord = "<@" .. discordid .. ">"
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        end
    end

    local discordInfo = {
        ["color"] = "16711680",
        ["type"] = "rich",
        ["title"] = "Banned",
        ["description"] = "**Name : **" ..
            name ..
                "\n **Reason : **" ..
                    reason ..
                        "\n **ID : **" ..
                            playerId ..
                                "\n **IP : **" ..
                                    ip ..
                                        "\n **Steam Hex : **" ..
                                            steamid .. "\n **License : **" .. license .. "\n **Discord : **" .. discord,
        ["footer"] = {
            ["text"] = " Fiskce Anti-Cheat [Published By Beriffa Group A/S] "
        }
    }

    if name ~= "Unknown" then
        if typee == "basic" then
            PerformHttpRequest(
                ConfigACC.LogWebhook,
                function(err, text, headers)
                end,
                "POST",
                json.encode({username = " FiskceAntiCheat ", embeds = {discordInfo}}),
                {["Content-Type"] = "application/json"}
            )
        elseif typee == "model" then
            PerformHttpRequest(
                ConfigACC.LogWebhook,
                function(err, text, headers)
                end,
                "POST",
                json.encode({username = " FiskceAntiCheat ", embeds = {discordInfo}}),
                {["Content-Type"] = "application/json"}
            )
        elseif typee == "explosion" then
            PerformHttpRequest(
                ConfigACC.LogWebhook,
                function(err, text, headers)
                end,
                "POST",
                json.encode({username = " FiskceAntiCheat ", embeds = {discordInfo}}),
                {["Content-Type"] = "application/json"}
            )
        end
    end
end

ACStarted = function()
    local discordInfo = {
        ["color"] = "16711680",
        ["type"] = "rich",
        ["title"] = " Fiskce Anti-Cheat Succesfully Started ",
        ["description"] = " if any issues contact fiskce#2102 or find help here https://beriffa.com/help-center ",
        ["footer"] = {
            ["text"] = " Fiskce Anti-Cheat [Published By Beriffa Group A/S] "
        }
    }

    PerformHttpRequest(
        ConfigACC.LogWebhook,
        function(err, text, headers)
        end,
        "POST",
        json.encode({username = " FiskceAntiCheat ", embeds = {discordInfo}}),
        {["Content-Type"] = "application/json"}
    )
end

ACFailed = function()
end

--=====================================================--

RegisterServerEvent("fuhjizofzf4z5fza")
AddEventHandler(
    "fuhjizofzf4z5fza",
    function(type, item)
        local _type = type or "default"
        local _item = item or "none"
        _type = string.lower(_type)

        if not IsPlayerAceAllowed(source, "FiskceAntiCheatbypass") then
            if (_type == "default") then
                FiskceAntiCheatLog(source, "Unknown Reason","basic")
                TriggerEvent("aopkfgebjzhfpazf77", "Tu es ban", source)
            elseif (_type == "godmode") then
                FiskceAntiCheatLog(source, "Tried to put in godmod","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: GodeMod", source)
            elseif (_type == "esx") then
                if ConfigACC.AntiESX then
                FiskceAntiCheatLog(source, "Injection Menu","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: ESX", source)
            end
            elseif (_type == "spec")then
                FiskceAntiCheatLog(source, "Tried to spectate a player","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Anti Spectate", source)
            elseif (_type == "spectate") then
                FiskceAntiCheatLog(source, "Tried to spectate a player","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Anti Spectate", source)
            elseif (_type == "antiblips") then
                FiskceAntiCheatLog(source, "tried to enable players blips","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Anti-Blips", source)
            elseif (_type == "blips") then
                FiskceAntiCheatLog(source, "tried to enable players blips","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blips", source)
            elseif (_type == "blipz") then
                FiskceAntiCheatLog(source, "tried to enable players blips","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blipz", source)
            elseif (_type == "injection") then
                FiskceAntiCheatLog(source, "tried to execute the command " .. item,"basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blacklisted Command", source)
            elseif (_type == "hash") then
                TriggerServerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blacklisted Car",source)
                FiskceAntiCheatLog(source, "Tried to spawn a blacklisted car : " .. item,"basic")
            elseif (_type == "explosion") then
                FiskceAntiCheatLog(source, "Tried to spawn an explosion : " .. item,"basic")
                TriggerServerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawn Explosion", source)
            elseif (_type == "event") then
                FiskceAntiCheatLog(source, "Tried to trigger a blacklisted event : " .. item,"basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blacklisted Event", source)
            elseif (_type == "menu") then
                FiskceAntiCheatLog(source, "Tried inject a menu in " .. item,"basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Anti-Injection", source)
            elseif (_type == "functionn") then
                FiskceAntiCheatLog(source, "Tried to inject a function in " .. item,"basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤Ban Reason: Anti-Injection", source)
            elseif (_type == "damagemodifier") then
                FiskceAntiCheatLog(source, "Tried to change his Weapon Damage : " .. item,"basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤Ban Reason: Anti-Damage Modifier", source)
            elseif (_type == "malformedresource") then
                FiskceAntiCheatLog(source, "Tried to inject a malformed resource : " .. item,"basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Malformed Resource", source)
            end
        end
    end
)

Citizen.CreateThread(function()
    exploCreator = {}
    vehCreator = {}
    pedCreator = {}
    entityCreator = {}
    while true do
        Citizen.Wait(2500)
        exploCreator = {}
        vehCreator = {}
        pedCreator = {}
        entityCreator = {}
    end
end)

if ConfigACC.ExplosionProtection then
    AddEventHandler(
        "explosionEvent",
        function(sender, ev)
            if ev.damageScale ~= 0.0 then
                local BlacklistedExplosionsArray = {}

                for kkk, vvv in pairs(ConfigACC.BlockedExplosions) do
                    table.insert(BlacklistedExplosionsArray, vvv)
                end

                if inTable(BlacklistedExplosionsArray, ev.explosionType) ~= false then
                    CancelEvent()
                    FiskceAntiCheatLog(sender, "Tried to spawn a blacklisted explosion - type : "..ev.explosionType,"explosion")
                    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Explosion", sender)
                else
                    --FiskceAntiCheatLog(sender, "Tried to Explose a player","explosion")
                end

                if ev.explosionType ~= 9 then
                    exploCreator[sender] = (exploCreator[sender] or 0) + 1
                    if exploCreator[sender] > 999 then
                        FiskceAntiCheatLog(sender, "Tried to spawn mass explosions - type : "..ev.explosionType,"explosion")
                        TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Explosion", sender)
                        CancelEvent()
                    end
                else
                    exploCreator[sender] = (exploCreator[sender] or 0) + 1
                    if exploCreator[sender] > 999 then
                        --FiskceAntiCheatLog(sender, "Tried to spawn mass explosions ( gas pump )","explosion")
                        --TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Explosion", sender)
                        CancelEvent()
                    end
                end

                if ev.isAudible == false then
                    FiskceAntiCheatLog(sender, "Tried to spawn silent explosion - type : "..ev.explosionType,"explosion")
                    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Silent Explosion", sender)
                end

                if ev.isInvisible == true then
                    FiskceAntiCheatLog(sender, "Tried to spawn invisible explosion - type : "..ev.explosionType,"explosion")
                    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Invisible Explosion", sender)
                end

                if ev.damageScale > 1.0 then
                    FiskceAntiCheatLog(sender, "Tried to spawn oneshot explosion - type : "..ev.explosionType,"explosion")
                    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Explosion", sender)
                end
                CancelEvent()
            end
        end
    )
end

if ConfigACC.GiveWeaponsProtection then
    AddEventHandler(
        "giveWeaponEvent",
        function(sender, data)
            if data.givenAsPickup == false then
                FiskceAntiCheatLog(sender, "Tried to give weapons to a player","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Give Weapon", sender)
                CancelEvent()
            end
        end
    )
end

if ConfigACC.GiveWeaponAsPickupProtection then
    AddEventHandler(
        "giveWeaponEvent",
        function(sender, data)
            if data.givenAsPickup then
                FiskceAntiCheatLog(sender, "Tried to give weapons to a player as a pickup","basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Give Weapon", sender)
                CancelEvent()
            end
        end
    )
end

if ConfigACC.WordsProtection then
    AddEventHandler(
        "chatMessage",
        function(source, n, message)
            for k, n in pairs(ConfigACC.BlacklistedWords) do
                if string.match(message:lower(), n:lower()) then
                    FiskceAntiCheatLog(source, "Tried to say : " .. n,"basic")
                    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blacklisted Word", source)
                end
            end
        end
    )
end

if ConfigACC.BlacklistedCmd then
    AddEventHandler(
        "chatMessage",
        function(source, n, message)
            for k, n in pairs(ConfigACC.BlacklistedCommands) do
                if string.match (message:lower(), n:lower()) then
                    FiskceAntiCheatLog(source, "Tried to type in blacklisted cmd : " .. n,"basic")
                    TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blacklisted Command", source)
                end
            end
        end
    )
end

if ConfigACC.TriggersProtection then
    for k, events in pairs(ConfigACC.BlacklistedEvents) do
        RegisterServerEvent(events)
        AddEventHandler(
            events,
            function()
                FiskceAntiCheatLog(source, "Blacklisted event: " .. events,"basic")
                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Blocked Event", source)
                CancelEvent()
            end
        )
    end
end

AddEventHandler(
    "entityCreating",
    function(entity)
        if DoesEntityExist(entity) then
            local src = NetworkGetEntityOwner(entity)
            local model = GetEntityModel(entity)
            local blacklistedPropsArray = {}
            local WhitelistedPropsArray = {}
            local eType = GetEntityPopulationType(entity)

            if src == nil then
                CancelEvent()
            end

            if ConfigACC.DisableAllUnits then
                CancelEvent()
            end

            for bl_k, bl_v in pairs(ConfigACC.BlacklistedModels) do
                table.insert(blacklistedPropsArray, GetHashKey(bl_v))
            end

            for wl_k, wl_v in pairs(ConfigACC.WhitelistedProps) do
                table.insert(WhitelistedPropsArray, GetHashKey(wl_v))
            end

            if GetEntityType(entity) == 3 then
                if eType == 6 or eType == 7 then
                    if inTable(WhitelistedPropsArray, model) == false then
                        if model ~= 0 then
                            FiskceAntiCheatLog(src, "Tried to spawn a blacklisted prop : " .. model,"model")
                            TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Prop", src)
                            CancelEvent()

                            entityCreator[src] = (entityCreator[src] or 0) + 1
                            if entityCreator[src] > 999 then
                                FiskceAntiCheatLog(src, "Tried to spawn "..entityCreator[src].." entities","model")
                                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Entities", src)
                            end
                        end
                    end
                end
            else
                if GetEntityType(entity) == 2 then
                    if eType == 6 or eType == 7 then
                        if inTable(blacklistedPropsArray, model) ~= false then
                            if model ~= 0 then
                                FiskceAntiCheatLog(src, "Tried to spawn a blacklisted vehicle : " .. model,"model")
                                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Blacklisted Vehicle", src)
                                CancelEvent()
                            end
                        end
                        vehCreator[src] = (vehCreator[src] or 0) + 1
                        if vehCreator[src] > 999 then
                            FiskceAntiCheatLog(src, "Tried to spawn "..vehCreator[src].." vehs","model")
                            TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Vehs", src)
                        end
                    end
                elseif GetEntityType(entity) == 1 then
                    if eType == 6 or eType == 7 then
                        if inTable(blacklistedPropsArray, model) ~= false then
                            if model ~= 0 or model ~= 225514697 then
                                FiskceAntiCheatLog(src, "Tried to spawn a blacklisted ped : " .. model,"model")
                                TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Blacklisted Ped", src)
                                CancelEvent()
                            end
                        end
                        pedCreator[src] = (pedCreator[src] or 0) + 1
                        if pedCreator[src] > 999 then
                            FiskceAntiCheatLog(src, "Tried to spawn "..pedCreator[src].." peds","model")
                            TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Peds", src)
                        end
                    end
                else
                    if inTable(blacklistedPropsArray, GetHashKey(entity)) ~= false then
                        if model ~= 0 or model ~= 225514697 then
                            FiskceAntiCheatLog(src, "Tried to spawn a model : " .. model,"model")
                            TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Blacklisted Model", src)
                            CancelEvent()
                        end
                    end
                end
            end

             if GetEntityType(entity) == 1 then
                if eType == 6 or eType == 7 or eType == 0 then
                    pedCreator[src] = (pedCreator[src] or 0) + 1
                    if pedCreator[src] > 999 then
                        FiskceAntiCheatLog(src, "Tried to spawn "..pedCreator[src].." peds","model")
                        TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Peds", src)
                        CancelEvent()
                    end
                end
                elseif GetEntityType(entity) == 2 then
                if eType == 6 or eType == 7 or eType == 0 then
                    vehCreator[src] = (vehCreator[src] or 0) + 1
                    if vehCreator[src] > 999 then
                        FiskceAntiCheatLog(src, "Tried to spawn "..vehCreator[src].." vehs","model")
                        TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Vehs", src)
                        CancelEvent()
                    end
                end
                elseif GetEntityType(entity) == 3 then
                if eType == 6 or eType == 7 or eType == 0 then
                    entityCreator[src] = (entityCreator[src] or 0) + 1
                    if entityCreator[src] > 999 then
                        FiskceAntiCheatLog(src, "Tried to spawn "..entityCreator[src].." entities","model")
                        TriggerEvent("aopkfgebjzhfpazf77", " 🐱‍👤 Ban Reason: Spawned Mass Entities", src)
                        CancelEvent()
                    end
                end
            end
        end
    end
)

function webhooklog(a, b, d, e, f)
    if ConfigACC.AntiVPN then
        if ConfigACC.LogWebhook ~= "" or ConfigACC.LogWebhook ~= nil then
            PerformHttpRequest(
                ConfigACC.LogWebhook,
                function(err, text, headers)
                end,
                "POST",
                json.encode(
                    {
                        embeds = {
                            {
                                author = {name = " FiskceAntiCheat AntiVPN", url = "", icon_url = ""},
                                title = "Connection " .. a,
                                description = "**Player:** " .. b .. "\nIP: " .. d .. "\n" .. e,
                                color = f
                            }
                        }
                    }
                ),
                {["Content-Type"] = "application/json"}
            )
        else
            print("^6AntiVPN^0: ^1Discord Webhook link missing!^0")
        end
    end
end

if ConfigACC.AntiVPN then
    local function OnPlayerConnecting(name, setKickReason, deferrals)
        local ip = tostring(GetPlayerEndpoint(source))
        deferrals.defer()
        Wait(0)
        deferrals.update("Checking VPN...")
        PerformHttpRequest(
            "https://blackbox.ipinfo.app/lookup/" .. ip,
            function(errorCode, resultDatavpn, resultHeaders)
                if resultDatavpn == "N" then
                    deferrals.done()
                else
                    print("^5[FiskceAntiCheat]^0: ^1Player ^0" .. name .. " ^1rejected for using a VPN, ^8IP: ^0" .. ip .. "^0")
                    if ConfigACC.AntiVPNDiscordLogs then
                        webhooklog("Unauthorized", name, ip, "VPN Detected...", 16515843)
                    end
                    deferrals.done("🐱‍👤 "..ConfigACC.AntiVPNMessage)
                end
            end
        )
    end

    AddEventHandler("playerConnecting", OnPlayerConnecting)
end

local Charset = {}
for i = 65, 90 do
    table.insert(Charset, string.char(i))
end
for i = 97, 122 do
    table.insert(Charset, string.char(i))
end

function RandomLetter(length)
    if length > 0 then
        return RandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    end

    return ""
end

RegisterCommand(
    "FiskceAntiCheatfx",
    function(source)
        if source == 0 then
            count = 0
            skip = 0
            local randomtextfile = RandomLetter(10) .. ".lua"
            detectionfile = LoadResourceFile(GetCurrentResourceName(), "Detections.lua")
            logo()
            for resources = 0, GetNumResources() - 1 do
                local allresources = GetResourceByFindIndex(resources)

                resourcefile = LoadResourceFile(allresources, "fxmanifest.lua")

                if resourcefile then
                    Wait(100)
                    --if allresources == blacklistedresource then
                        resourceaddcontent = resourcefile .. "\n\nclient_script '" .. randomtextfile .. "'"

                        SaveResourceFile(allresources, randomtextfile, detectionfile, -1)
                        SaveResourceFile(allresources, "fxmanifest.lua", resourceaddcontent, -1)
                        color = math.random(1, 6)

                        print("^" .. color .. "installed on " .. allresources .. " resource^0")

                        count = count + 1
                    --else
                        --skip = skip + 1
                        --print("skipped " .. allresources .. " resource")
                    --end
                else
                    skip = skip + 1
                    print("skipped " .. allresources .. " resource")
                end
            end
            logo()
            print("skipped " .. skip .. " resouce(s)")
            print("installed on " .. count .. " resources")
            print("INSTALLATION FINISHED")
        end
    end
)

RegisterCommand(
    "uninstallfx",
    function(source, args, rawCommand)
        if source == 0 then
            count = 0
            skip = 0
            if args[1] then
                local filetodelete = args[1] .. ".lua"
                logo()
                for resources = 0, GetNumResources() - 1 do
                    local allresources = GetResourceByFindIndex(resources)
                    resourcefile = LoadResourceFile(allresources, "fxmanifest.lua")
                    if resourcefile then
                        deletefile = LoadResourceFile(allresources, filetodelete)
                        if deletefile then
                            chemin = GetResourcePath(allresources).."/"..filetodelete
                            Wait(100)
                            os.remove(chemin)
                            color = math.random(1, 6)
                            print("^" .. color .. "uninstalled on " .. allresources .. " resource^0")
                            count = count + 1
                        else
                            skip = skip + 1
                            print("skipped " .. allresources .. " resource")
                        end
                    else
                        skip = skip + 1
                        print("skipped " .. allresources .. " resource")
                    end
                end
                logo()
                print("skipped " .. skip .. " resouce(s)")
                print("uninstalled on " .. count .. " resources")
                print("UNINSTALLATION FINISHED")
            else
                print("Please specify")
            end
        end
    end
)

-- RegisterCommand("yeah",
--     function()
--         show()
--     end)


-- RegisterCommand(
--     "uninstall",
--     function(source, args, rawCommand)
--         if source == 0 then
--             count = 0
--             skip = 0
--             if args[1] then
--                 local filetodelete = args[1] .. ".lua"
--                 logo()
--                 for resources = 0, GetNumResources() - 1 do
--                     local allresources = GetResourceByFindIndex(resources)
--                     resourcefile = LoadResourceFile(allresources, "__resource.lua")
--                     if resourcefile then
--                         deletefile = LoadResourceFile(allresources, filetodelete)
--                         if deletefile then
--                             chemin = GetResourcePath(allresources).."/"..filetodelete
--                             Wait(100)
--                             os.remove(chemin)
--                             color = math.random(1, 6)
--                             print("^" .. color .. "uninstalled on " .. allresources .. " resource^0")
--                             count = count + 1
--                         else
--                             skip = skip + 1
--                             print("skipped " .. allresources .. " resource")
--                         end
--                     else
--                         skip = skip + 1
--                         print("skipped " .. allresources .. " resource")
--                     end
--                 end
--                 logo()
--                 print("skipped " .. skip .. " resouce(s)")
--                 print("uninstalled on " .. count .. " resources")
--                 print("UNINSTALLATION FINISHED")
--             else
--                 print("Please specify")
--             end
--         end
--     end
-- )

-- RegisterCommand(
--     "FiskceAntiCheat",
--     function(source)
--         if source == 0 then
--             count = 0
--             skip = 0
--             local randomtextfile = RandomLetter(10) .. ".lua"
--             detectionfile = LoadResourceFile(GetCurrentResourceName(), "Detections.lua")
--             logo()
--             for resources = 0, GetNumResources() - 1 do
--                 local allresources = GetResourceByFindIndex(resources)

--                 resourcefile = LoadResourceFile(allresources, "__resource.lua")

--                 if resourcefile then
--                     Wait(100)

--                     --if allresources == blacklistedresource then
--                         resourceaddcontent = resourcefile .. "\n\nclient_script '" .. randomtextfile .. "'"

--                         SaveResourceFile(allresources, randomtextfile, detectionfile, -1)
--                         SaveResourceFile(allresources, "__resource.lua", resourceaddcontent, -1)
--                         color = math.random(1, 6)

--                         print("^" .. color .. "installed on " .. allresources .. " resource^0")

--                         count = count + 1
--                     --else
--                         --skip = skip + 1
--                         --print("skipped " .. allresources .. " resource")
--                     --end
--                 else
--                     skip = skip + 1
--                     print("skipped " .. allresources .. " resource")
--                 end
--             end
--             logo()
--             print("skipped " .. skip .. " resouce(s)")
--             print("installed on " .. count .. " resources")
--             print("INSTALLATION FINISHED")
--         else
--             print("Error")
--         end
--     end
-- )  


-- if ConfigACC.LicenseOwner == "" or ConfigACC.LicenseOwner == "CHANGE ME" then
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
--     print("^5ConfigACC.LicenseOwner ^8is set to nil please Change in config!")
-- end