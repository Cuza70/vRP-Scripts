-----------------------------------------------------------
--[[### vrp_help_command ### Script by Cuza]]--
-----------------------------------------------------------

RegisterCommand("help", function(source, args)
    TriggerServerEvent('help', table.concat(args, " "))
end)