Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetEveryoneIgnorePlayer(PlayerId(), true)
    end
end)