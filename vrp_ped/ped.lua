-----------------------------------------------------------
--[[### vrp_ped ### Script by Cuza]]--
-----------------------------------------------------------

local Ipeds = { 
    -- Example {model=" ", x=, y=, z=, heading=},
    {model="s_f_y_scrubs_01", x=-1767.9898681641, y=-1153.0002441406, z=13.061911582947, heading=258.693},
  }

  Citizen.CreateThread(function()
    for k,v in ipairs(Ipeds) do
      RequestModel(GetHashKey(v.model))
      while not HasModelLoaded(GetHashKey(v.model)) do
        Wait(0)
      end

      local pedss = CreatePed(5, GetHashKey(v.model), v.x, v.y, v.z, v.heading, false, false)
      SetBlockingOfNonTemporaryEvents(pedss, true)
      SetAmbientVoiceName(pedss, v.voice)
      SetModelAsNoLongerNeeded(GetHashKey(v.model))
    end
end)