-----------------------------------------------------------
--[[### vrp_speedometer ### Script by Cuza]]--
--[[### Speedometer inspired from samp ###]]--
-----------------------------------------------------------

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(7)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(2, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

function drawTxt1(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(4)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(2, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

function lock()
    if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
      if IsControlJustPressed(1,303) then -- Change to a number which can be found here: https://wiki.fivem.net/wiki/Controls
        veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local locked = GetVehicleDoorLockStatus(veh) >= 2
        if locked then -- unlock
          SetVehicleDoorsLockedForAllPlayers(veh, false)
          SetVehicleDoorsLocked(veh,1)
          SetVehicleDoorsLockedForPlayer(veh, PlayerId(), false)
          --notify("UNLOCKED")
        else -- lock
          SetVehicleDoorsLocked(veh,2)
          SetVehicleDoorsLockedForAllPlayers(veh, true)
          --notify("LOCKED")
        end
      end
    else 
      if IsControlJustPressed(1,303) then -- Change to a number which can be found here: https://wiki.fivem.net/wiki/Controls
        veh =  GetVehiclePedIsIn(GetPlayerPed(-1), true)
        
        local locked = GetVehicleDoorLockStatus(veh) >= 2
        if locked then -- unlock
          SetVehicleDoorsLockedForAllPlayers(veh, false)
          SetVehicleDoorsLocked(veh,1)
          SetVehicleDoorsLockedForPlayer(veh, PlayerId(), false)
          --notify("UNLOCKED")
        else -- lock
          SetVehicleDoorsLocked(veh,2)
          SetVehicleDoorsLockedForAllPlayers(veh, true)
          --notify("LOCKED")
        end
      end
    end
  end

  function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

  Citizen.CreateThread(function()
    while true do
          Citizen.Wait(0)
          player = GetPlayerPed(-1)
          lock()
          if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false) 
            local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6 --speed
            plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false)) --plate
            local fuel    = math.ceil(round(GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false)), 1)) --fuel
              if GetVehicleDoorLockStatus(veh) >= 2 then
                  status = "LOCKED"
              else
                  status = "UNLOCKED"
              end
              drawTxt(1.35, 1.20, 1.0,1.0,0.84 , "~b~" .. math.ceil(kmh), 255, 255, 255, 255) 
              drawTxt1(1.39, 1.21, 1.0,1.0,0.54 , "KM/H", 255, 255, 255, 255) 
              drawTxt1(1.35, 1.25, 1.0,1.0,0.54 , "FUEL: ~b~" .. tostring(fuel) , 255, 255, 255, 255)
              drawTxt1(1.35, 1.29, 1.0,1.0,0.54 , "PLATE: ~b~" .. plate , 255, 255, 255, 255)
              drawTxt1(1.35, 1.33, 1.0,1.0,0.54 , "~b~" .. status , 255, 255, 255, 255)
          end
      end
  end)
  
  function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
  end
