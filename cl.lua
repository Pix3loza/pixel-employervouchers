
for i = 1, #ReceivingVouchersLocations, 1 do
    local Locations = ReceivingVouchersLocations[i]

    exports.ox_target:addSphereZone({
        coords = vector3(ReceivingVouchersLocations[i].x, ReceivingVouchersLocations[i].y, ReceivingVouchersLocations[i].z),
        radius = 1.0,
        drawSprite = false,
        options = {
            {
                label = 'Recive Vouchers',
                icon = "fa-solid fa-user-doctor",
                distance = 2.0,
                onSelect = function()
                    local count = exports.ox_inventory:Search('count', VoucherItem)
                    lib.playAnim(cache.ped, 'mp_common' , 'givetake1_a') 

                    if count >= 1 then
                        TriggerServerEvent('pixel-vouchers:receivedvouchers')
                    else
                        ESX.ShowNotification(Notify['no_enought_vouchers'])
                    end
                end
            },

        }
    }) 
end