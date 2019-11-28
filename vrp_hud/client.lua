-----------------------------------------------------------
--[[### vrp_hud ### Script by Cuza]]--
--[[### Hud inspired from samp ###]]--
-----------------------------------------------------------

Citizen.CreateThread(function()
    Wait(50)
    while true do
        text(1.355, 1.395, 1.0,1.0,0.50, '' ..GetPlayerName(NetworkGetEntityOwner(GetPlayerPed(-1))).. ' / Server Name Community', 255, 255, 255, 255) -- Name and name server
        Citizen.Wait(1)
    end
end)

function text(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 255, 255, 255, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.070)
end

Citizen.CreateThread(function()
    Wait(50)
    while true do 
    local players = 0
     for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
                players = players+1
          end
       end 
        local hour = GetClockHours()
        local minutes = GetClockMinutes()
        text1(1.395, 1.365, 1.0,1.0,0.50, ' ' ..hour..':'..minutes.. ' [' ..players.. ' / 32]', 255, 255, 255, 255) -- hour from game and number of players
        Citizen.Wait(1)
    end
end)

function text1(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 255, 255, 255, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.070)
end
