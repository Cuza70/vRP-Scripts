-----------------------------------------------------------
--[[### vrp_dead_animation ### Script by Cuza]]--
-----------------------------------------------------------

local playerKey = 44 -- Change to a number which can be found here: https://wiki.fivem.net/wiki/Controls
local playerKey2 = 32 -- Change to a number which can be found here: https://wiki.fivem.net/wiki/Controls
local playerDistance = 0 
local ragdollSelf = true 

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(0, playerKey2) then
		if IsControlPressed(0, playerKey) then
			if IsPedInAnyVehicle(PlayerPedId()) then
				
			else
				local player, distance = GetClosestPlayer()
				local playerID = GetPlayerServerId(player)
				if distance and distance <= playerDistance then
					TriggerServerEvent('playerClient', playerID)
				end
				if ragdollSelf then
					SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
				end
			end
		end
	end
end
end)

RegisterNetEvent('playerClient')
AddEventHandler('playerClient', function()
	
	Citizen.Wait(1)
	SetPedToRagdoll(PlayerPedId(), 5000, 5000, 0, 0, 0, 0)
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
    local closestPlayer, closestDistance

    for index, value in ipairs(GetPlayers()) do
		if GetPlayerPed(value) ~= PlayerPedId() then
			local distance = Vdist(GetEntityCoords(GetPlayerPed(value), true), GetEntityCoords(PlayerPedId(), true))

			if not closestDistance or closestDistance > distance then
				closestPlayer = value
				closestDistance = distance
			end
		end
    end

    return closestPlayer, closestDistance
end