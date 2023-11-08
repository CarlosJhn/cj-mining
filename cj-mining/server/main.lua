local QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

RegisterServerEvent("cj-mining:server:menambangbatu")
AddEventHandler("cj-mining:server:menambangbatu", function()
    local src = source
    local batu = Config.Peluang[2]
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    if ox_inventory:CanCarryItem(src, Config.Barang[1], batu) then
        Player.Functions.AddItem(Config.Barang[1], batu)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Barang[1]], "add")
        TriggerClientEvent("k5_notify:notify", src, 'Success', 'You ve successfully mined some stones', 'success', 3000)
    end
end)

RegisterServerEvent('cj-mining:server:rusak')
    AddEventHandler('cj-mining:server:rusak', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local PeluangRusak = Config.Peluang[1]
    if PeluangRusak <= 20 and item == 'beliung' then
        Player.Functions.RemoveItem('beliung', 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['beliung'], "remove")
        TriggerClientEvent("k5_notify:notify", src, 'Pickaxe', 'Your pickaxe broke', 'info', 3000)
    elseif PeluangRusak >= 21 and PeluangRusak <= 79 and item == 'beliung' then
        TriggerClientEvent("k5_notify:notify", src, 'Pickaxe', 'Your pickaxe has some damage', 'info', 3000)
    elseif PeluangRusak >= 80 and PeluangRusak <= 100 and item == 'beliung' then
        TriggerClientEvent("k5_notify:notify", src, 'Pickaxe', 'Your pickaxe has no damage', 'info', 3000)
    end
end)

RegisterNetEvent('cj-mining:server:cucibatu', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    if ox_inventory:CanCarryItem(src, Config.Barang[2], Config.Jumlah[3]) then
        Player.Functions.RemoveItem(Config.Barang[1], Config.Jumlah[3])
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Barang[1]], "remove")
        Player.Functions.AddItem(Config.Barang[2], Config.Jumlah[3])
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Barang[2]], "add")
        TriggerClientEvent("k5_notify:notify", src, 'Success', 'You successfully washed the stones', 'success', 3000)
    end
end)

RegisterNetEvent('cj-mining:server:leburbatu', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local PeluangDapatItem = math.random(1, 100)
    
    local cekinventorycukup = true
    for i = 1, 4 do
        if not ox_inventory:CanCarryItem(src, Config.HadiahMelebur[i].barang, Config.HadiahMelebur[i].Peluang) then
            cekinventorycukup = false
            break
        end
    end

    if PeluangDapatItem >= 1 and PeluangDapatItem <= 79 and cekinventorycukup then
        Player.Functions.RemoveItem(Config.Barang[2], Config.Jumlah[1])
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Barang[1]], "remove")
        
        for i = 1, 3 do
            Player.Functions.AddItem(Config.HadiahMelebur[i].barang, Config.HadiahMelebur[i].Peluang)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HadiahMelebur[i].barang], "add")
        end

        TriggerClientEvent("k5_notify:notify", src, 'Success', 'You successfully melted the stone', 'success', 3000)
    elseif PeluangDapatItem >= 80 and PeluangDapatItem <= 100 and cekinventorycukup then
        Player.Functions.RemoveItem(Config.Barang[2], Config.Jumlah[1])
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Barang[1]], "remove")

        for i = 1, 4 do
            Player.Functions.AddItem(Config.HadiahMelebur[i].barang, Config.HadiahMelebur[i].Peluang)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HadiahMelebur[i].barang], "add")
        end

        TriggerClientEvent("k5_notify:notify", src, 'Success', 'You successfully melted the stone', 'success', 3000)
    end
end)



