local playerSpawned = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function()
    playerSpawned = true
end)

RegisterNetEvent('pavyn_ui:RequestData')
AddEventHandler('pavyn_ui:RequestData', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local data = {
            xPlayer.getAccount('money').money,
            xPlayer.getAccount('bank').money,
            xPlayer.getAccount('black_money').money
        }
        TriggerClientEvent('pavyn_ui:GetData', xPlayer.source, data)
    end
end)