local playerSpawned = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function()
    playerSpawned = true
end)

RegisterNetEvent('pavyn_ui:GetData')
AddEventHandler('pavyn_ui:GetData', function(data)
    SendNUIMessage({
        money = data
    })
end)

Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('pavyn_ui:RequestData')
        Citizen.Wait(Config.UpdateIntervalSV)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(50)
    SendNUIMessage({
        joined = true,
        servername = Config.ServerName,
        kmh        = Config.KMH,
    })
end)

Citizen.CreateThread(function()
    Citizen.Wait(200)
    while true do
        local ped    = PlayerPedId()
        local player = PlayerId()
        local speed = 0

        if not IsPedInAnyVehicle(ped, false) then
            speed = nil
        else
            if Config.KMH then
                speed = math.floor( GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 3.6 )
            else
                speed = math.floor( GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 2.236936 )
            end
        end
        
        SendNUIMessage({
            speed   = speed,
            health  = math.floor(GetEntityHealth(ped) / 2),
            armor   = math.floor(GetPedArmour(ped) / 2),
            id      = GetPlayerServerId(player),
            players = GetNumberOfPlayers(),
            kmh        = Config.KMH
        })
        Citizen.Wait(Config.UpdateIntervalCL)
    end
end)

RegisterCommand('hideUI', function()
    SendNUIMessage({ hide = true })
end)