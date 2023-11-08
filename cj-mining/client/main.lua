local QBCore = exports['qb-core']:GetCoreObject()
local mulaimenambang = false
local cucibatu = false
      
Citizen.CreateThread(function()

    for _, v in pairs(Config.blips) do
      v.blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(v.blip, v.id)
      SetBlipDisplay(v.blip, 4)
      SetBlipScale(v.blip, 0.8)
      SetBlipColour(v.blip, v.colour)
      SetBlipAsShortRange(v.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(v.title)
      EndTextCommandSetBlipName(v.blip)
    end
end)

CreateThread(function()
    for _, v in pairs(Config.Areamenambang) do
    exports.ox_target:addBoxZone({
        coords = v.koordinat,
        size = vector3(2, 2, 2),
        rotation = 45,
        debug = false,
        options = {
            {
                name = v.Id,
                event = v.event,
                icon = v.ikon,
                label = v.nama,
            }
        }
    })
    end
end)

local LoadAnimDict = function(dict)
    local memuat = HasAnimDictLoaded(dict)

    while not memuat do
        RequestAnimDict(dict)
        Wait(5)
        memuat = not memuat
    end
end

AddEventHandler('cj-mining:client:AnimasiMenambangBatu', function()
    local ped = PlayerPedId()
    Wait(100)
    lib.requestAnimDict(Config.Anim[1].dict, 5000)
    TaskPlayAnim(ped, Config.Anim[1].dict, Config.Anim[1],nama, -8.0, 8.0, 0.5, 1, 0.8, false, false, false)
end)

RegisterNetEvent('cj-mining:client:menambangbatu')
AddEventHandler('cj-mining:client:menambangbatu', function()
        local player = PlayerPedId()
        local punyabarang = QBCore.Functions.HasItem(Config.Persyaratanbarang[1], 1)
        local model = 'prop_tool_pickaxe'
        local axe = CreateObject(model, GetEntityCoords(cache.ped), true, false, false)
        if mulaimenambang == false then
            if punyabarang then
                    mulaimenambang = true
                    local berhasil = exports["qb-lock"]:StartLockPickCircle(1, 15, success)
                    if berhasil then
                        SetCurrentPedWeapon(cache.ped, unarmed)
                        FreezeEntityPosition(player, true)
                        ClearPedTasks(cache.ped)
                        TriggerEvent('cj-mining:client:AnimasiMenambangBatu')
                        AttachEntityToEntity(axe, cache.ped, GetPedBoneIndex(cache.ped, 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 0, true)
                        QBCore.Functions.Progressbar("mining", "Hitting Rock...", 9000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function()
                            ClearPedTasks(cache.ped)
                            FreezeEntityPosition(player, false)
                            TriggerServerEvent('cj-mining:server:menambangbatu')
                            --TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
                            --exports['qb-reputation']:UpdateSkill('Mining', 1)
                            DeleteObject(axe)
                            SetModelAsNoLongerNeeded(model)
                            RemoveAnimDict(Config.Anim[1].dict)
                            mulaimenambang = false
                        end)    
                    else
                        ClearPedTasks(cache.ped)
                        FreezeEntityPosition(player, false)
                        DeleteObject(axe)
                        SetModelAsNoLongerNeeded(model)
                        RemoveAnimDict(Config.Anim[1].dict)
                        QBCore.Functions.Notify('Failed!', 'error', 5000)
                        TriggerServerEvent('cj-mining:server:rusak', 'beliung')
                        mulaimenambang = false
                end
            else
                DeleteObject(axe)
                SetModelAsNoLongerNeeded(model)
                exports["kingdom_notify"]:notify( 'Failed', 'you dont have pickaxe' , 'error', 3000)
            end
        else
            DeleteObject(axe)
            SetModelAsNoLongerNeeded(model)
            exports["kingdom_notify"]:notify( 'Failed', 'you are busy the moment' , 'error', 3000)
        end
    end)


    AddEventHandler('cj-mining:client:AnimasiCuciBatu', function()
        local ped = PlayerPedId()
        Wait(100)
        lib.requestAnimDict(Config.Anim[2],dict, 5000)
        TaskPlayAnim(ped, Config.Anim[2],dict, Config.Anim[2],nama, -8.0, 8.0, 0.5, 1, 0.8, false, false, false)
    end)

    RegisterNetEvent('cj-mining:client:cucibatu', function ()
        local source = source
        local Player = QBCore.Functions.GetPlayerData()
        local punyabarang = QBCore.Functions.HasItem(Config.Barang[1], 3)
        if punyabarang then
            local berhasil = exports['qb-lock']:StartLockPickCircle(1, 15)
            if berhasil then
                TriggerEvent('cj-mining:client:AnimasiCuciBatu')
                cucibatu = true
                QBCore.Functions.Progressbar("cucibatu", "Washing Stone...", 8000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    RemoveAnimDict(Config.Anim[1].dict)
                    TriggerServerEvent('cj-mining:server:cucibatu')
                    cucibatu = false
                end)
            else
                RemoveAnimDict(Config.Anim[1].dict)
                exports["kingdom_notify"]:notify('Failed', 'You failed to wash the stones' , 'error', 3000)
                return
            end
        else
            RemoveAnimDict(Config.Anim[1].dict)
            exports["kingdom_notify"]:notify('Failed', 'You dont have enough stones' , 'error', 3000)
        end
    end)

    AddEventHandler('cj-mining:client:AnimasiLeburBatu', function()
        local ped = PlayerPedId()
        Wait(100)
        lib.requestAnimDict(Config.Anim[3].dict, 5000)
        TaskPlayAnim(ped, Config.Anim[3].dict, Config.Anim[3],nama, -8.0, 8.0, 0.5, 1, 0.8, false, false, false)
    end)

    
    RegisterNetEvent('cj-mining:client:leburbatu', function ()
        local source = source
        local Player = QBCore.Functions.GetPlayerData()
        local punyabarang = QBCore.Functions.HasItem(Config.Barang[2], 1)
        if punyabarang then
            local berhasil = exports['qb-lock']:StartLockPickCircle(1, 15)
            if berhasil then
                TriggerEvent('cj-mining:client:AnimasiLeburBatu')
                cucibatu = true
                QBCore.Functions.Progressbar("cucibatu", "Smelting Stone...", 8000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    RemoveAnimDict(Config.Anim[3].dict)
                    TriggerServerEvent('cj-mining:server:leburbatu')
                    cucibatu = false
                end)
            else
                RemoveAnimDict(Config.Anim[3].dict)
                exports["kingdom_notify"]:notify('Failed', 'You failed to smelt the stone' , 'error', 3000)
                return
            end
        else
            RemoveAnimDict(Config.Anim[3].dict)
            exports["kingdom_notify"]:notify('Failed', 'You dont have enough washed stone' , 'error', 3000)
        end
    end)