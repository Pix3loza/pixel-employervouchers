Citizen.CreateThread(function ()
    while true do
        local xPlayers = ESX.GetExtendedPlayers()

        for _, xPlayer in pairs(xPlayers) do
            if Jobs[xPlayer.getJob().name] then
                exports.ox_inventory:AddItem(xPlayer.source, VoucherItem, Jobs[xPlayer.getJob().name][xPlayer.getJob().grade])
            end
        end

        Wait(1000 * GiveVoucherInterval)
    end
end)

RegisterNetEvent('pixel-vouchers:receivedvouchers', function ()
    local xPlayer = ESX.GetPlayerFromId(source)
    local count = exports.ox_inventory:GetItemCount(source, VoucherItem)
    if count >= 1 then
        if Jobs[xPlayer.getJob().name] then 
            exports.ox_inventory:RemoveItem(xPlayer.source, VoucherItem, count)
            exports.ox_inventory:AddItem(xPlayer.source, 'money', count * VoucherPrice)
        end
    end
end)