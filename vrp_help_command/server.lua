-----------------------------------------------------------
--[[### vrp_help_command ### Script by Cuza]]--
-----------------------------------------------------------

RegisterServerEvent('help')
AddEventHandler('help', function(text)
    TriggerClientEvent('chatMessage', -1, ' ^0[^3 ' ..GetPlayerName(1).. ' ^0| ^3Help^0]', {0,0,0} , text)
end)