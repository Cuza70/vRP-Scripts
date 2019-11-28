-----------------------------------------------------------
--[[### vrp_dead_animation ### Script by Cuza]]--
-----------------------------------------------------------

RegisterServerEvent('playerServer')
AddEventHandler('playerServer', function(closestID)
	TriggerClientEvent("playerClient", closestID)
end)
