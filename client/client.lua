local RSGCore = exports['rsg-core']:GetCoreObject()
local isLoggedIn = false
local PlayerData = {}
local createdEntries = {}
local currentjob
local jobaccess


-----------------------------------------------------------------------------------

AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = RSGCore.Functions.GetPlayerData()
    currentjob = PlayerData.job.name
end)

RegisterNetEvent('RSGCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    PlayerData = {}
end)

RegisterNetEvent('RSGCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    currentjob = PlayerData.job.name
end)

-----------------------------------------------------------------------------------

-- prompts and blips
CreateThread(function()
    for k, v in pairs(Config.TreeCraftingPoint) do
        exports['rsg-core']:createPrompt(v.prompt, v.coords, RSGCore.Shared.Keybinds['J'], Lang:t('menu.open') .. v.name, {
            type = 'client',
            event = 'rsg-lumberjack:client:mainmenu',
            args = { v.job },
        })

        createdEntries[#createdEntries + 1] = { type = 'PROMPT', handle = v.prompt }

        if v.showblip == true then
            local StoreBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(StoreBlip, 1904459580, 1)
            SetBlipScale(StoreBlip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, StoreBlip, v.name)
        end

    end
end)

-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------

function Cooldown()
    cooldown = 7.2e+6
    Wait(cooldown)
    print(cooldown)
    Cooldown = true
    collected = false

end

RegisterNetEvent('rsg-lumberjack:client:sap', function ()

    ------------------------------
    Trees = {
        9982225, 964002300,-- 
    }
    if not collected then
        local hasItem = RSGCore.Functions.HasItem("bucket", 1)
        if hasItem then
            exports['rsg-target']:AddTargetModel(Trees, {
                options = {
                    {
                        type = "client",
                        event = 'rsg-lumberjack:client:collecting',
                        icon = "far fa-eye",
                        label = ('Collect Sap'),
                        distance = 1.5
                    }
                }
            })
        else
            RSGCore.Functions.Notify('Need (Sap Tap) (Bucket)', 'error', 5000)
        end
    end
    end)
    
    function Progress()
        local saptbl = 0
        CreateThread( function ()
            while true do
                Wait(5)
            local progress = 0
            --Timing--
            --Wait(1.02e+6)
            Wait(1.02e+6)
            progress = 20
            RSGCore.Functions.Notify('Sap Collection 20%', 'success', 5000)
            Wait(1.02e+6)
            progress = 40
            RSGCore.Functions.Notify('Sap Collection 40%', 'success', 5000)
            Wait(1.02e+6)
            progress = 60
            RSGCore.Functions.Notify('Sap Collection 60%', 'success', 5000)
            Wait(1.02e+6)
            progress = 80
            RSGCore.Functions.Notify('Sap Collection 80%', 'success', 5000)
            Wait(1.02e+6)
            progress = 100
            RSGCore.Functions.Notify('Sap Collection 100%', 'success', 5000)
            --Table--
            if progress == 100 then
                saptbl = 100
                print(saptbl)
                Collect()
            end
            break
            end
        end)
    end

    function Collect()
        local saptbl = 100
        local Player = PlayerPedId()
        local PlayerPos = GetEntityCoords(Player)
        collected = false
        Trees = {
            9982225, 964002300,-- 
        }
                                        -- Do Actions --
                                        if saptbl == 100 then
                                            if not collected then
                                                exports['rsg-target']:AddTargetModel(Trees, {
                                                    options = {
                                                        {
                                                            type = "client",
                                                            event = 'rsg-lumberjack:client:collectsap',
                                                            icon = "far fa-eye",
                                                            label = ('Collect Sap Bucket'),
                                                            distance = 1.5,
                                                            args = {
                                                            collected = true
                                                            }
                                                        }
                                                    }
                                                })
                                            end
                                            
                                        end
    end
    RegisterNetEvent('rsg-lumberjack:client:collectsap', function ()
        if not collected then
            TriggerServerEvent('rsg-lumberjack:server:sap100')
            collected = true
            Cooldown()
        else
            RSGCore.Functions.Notify('Sap Allready Collected', 'error', 5000)
        end
    end)
    RegisterNetEvent('rsg-lumberjack:client:removetarget', function ()
        Trees = {
            9982225, 964002300,-- 
        }
        exports['rsg-target']:RemoveTargetModel(Trees,{
            options ={
                type = "server",
                event = 'rsg-lumberjack:server:sap100',
                icon = "far fa-eye",
                label = ('Collect Sap Bucket'),
            }
        })
    end)
    
    RegisterNetEvent("rsg-lumberjack:client:collecting", function ()
    local Player = PlayerPedId()
    local tree = {"p_tree_douglasfir_03"}
    local treeh =  GetHashKey(tree)
    local PlayerPos = GetEntityCoords(Player)
    local treec = GetClosestObjectOfType(PlayerPos, 3.0, treeh, false)
    local treepos = GetEntityCoords(treec)
    local treecords = GetOffsetFromEntityInWorldCoords(treepos, 0.0, -0.97, 0.05)
    local distanceCheck1 = #(PlayerPos - treecords)
    if not started then
        if debug then
        print(distanceCheck1)
        end
            if distanceCheck1 <= 30000 then
            local hasItem = RSGCore.Functions.HasItem("bucket", 1)
                if hasItem then
                    started = true
                    TriggerServerEvent('rsg-lumberjack:server:removesap', source)
        --Animation--
                    local player = PlayerPedId()
                    local wait = (1000)
                    Progress()
                    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
                    FreezeEntityPosition(player, true)
                    ClearPedTasks(player)
                    --local prop = CreateObject(GetHashKey("p_potsm01a"), PlayerPos, true, true, true)
                    --AttachEntityToEntity(prop, tree, PlayerPos, 0.0, 0.0, 0.08, 0.0, 0.0, 0.0, true, false, true, false, 0, true)
                    local stemAnim1Dict2 = "ai_react@point@witness"
                    local stemAnim2 = "000_enter"
                    local LoadAnimDict = function(dict)
        
                    local isLoaded = HasAnimDictLoaded(dict)
        
                    while not isLoaded do
                        RequestAnimDict(dict)
                        Wait(5)
                        isLoaded = not isLoaded
                    end
                end 
                LoadAnimDict(stemAnim1Dict2)
                Wait(100)
                TaskPlayAnim(player, stemAnim1Dict2, stemAnim2, 1.0, 1.0, -1, 2, 0, false, false, false)
                FreezeEntityPosition(player, true)
                Wait(wait)
                ClearPedTasks(player)
                FreezeEntityPosition(player, false)
                --table.insert(Propt,prop)
                -- Sap Table --
            else
                RSGCore.Functions.Notify('Need Sap Tap / Bucket', 'error', 5000)
            end
        end
    else
        RSGCore.Functions.Notify('Sap Collection Allready Started', 'error', 5000)
    end
    end)

    
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

-- lumberjack menu
RegisterNetEvent('rsg-lumberjack:client:mainmenu', function(jobaccess)
    if currentjob == jobaccess then
        exports['rsg-menu']:openMenu({
            {
                header =  ('Lumberjack Crafting'),
                isMenuHeader = true,
            },
			{
                header = ('Crafting Componets'),
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-lumberjack:client:componetsmenu',
                    isServer = false,
                }
            },
            {
                header = ('Crafting Tools'),
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'rsg-lumberjack:client:toolsmenu',
                    isServer = false,
                }
            },
            {
                header = ('Storage'),
                txt = "",
                icon = "fas fa-box",
                params = {
                    event = 'rsg-lumberjack:client:storage',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = Lang:t('menu.job_management'),
                txt = "",
                icon = "fas fa-user-circle",
                params = {
                    event = 'rsg-bossmenu:client:OpenMenu',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = Lang:t('menu.close_menu'),
                txt = '',
                params = {
                    event = 'rsg-menu:closeMenu',
                }
            },
        })
    else
        RSGCore.Functions.Notify(Lang:t('error.you_are_not_authorised'), 'error')
    end
end)


-- lumberjack craft menu
RegisterNetEvent('rsg-lumberjack:client:componetsmenu', function()
    componetMenu = {}
    componetMenu = {
        {
            header = ('Componets'),
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.ComponetsCrafting) do
        local text = ""
        for k, v in pairs(v.craftitems) do
            text = text .. "- " .. RSGCore.Shared.Items[v.item].label .. ": " .. v.amount .. "x <br>"
        end
        componetMenu[#componetMenu + 1] = {
            header = v.lable,
            txt = text,
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-lumberjack:client:componetcheckitems',
                args = {
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    componetMenu[#componetMenu + 1] = {
        header = Lang:t('menu.close_menu'),
        txt = '',
        params = {
            event = 'rsg-menu:closeMenu',
        }
    }
    exports['rsg-menu']:openMenu(componetMenu)
end)

RegisterNetEvent('rsg-lumberjack:client:toolsmenu', function()
    toolMenu = {}
    toolMenu = {
        {
            header = ('Tools'),
            isMenuHeader = true,
        },
    }
    local item = {}
    for k, v in pairs(Config.ToolsCrafting) do
        local text = ""
        for k, v in pairs(v.craftitems) do
            text = text .. "- " .. RSGCore.Shared.Items[v.item].label .. ": " .. v.amount .. "x <br>"
        end
        toolMenu[#toolMenu + 1] = {
            header = v.lable,
            txt = text,
            icon = 'fas fa-cog',
            params = {
                event = 'rsg-lumberjack:client:toolscheckitems',
                args = {
                    name = v.name,
                    lable = v.lable,
                    item = k,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    toolMenu[#toolMenu + 1] = {
        header = Lang:t('menu.close_menu'),
        txt = '',
        params = {
            event = 'rsg-menu:closeMenu',
        }
    }
    exports['rsg-menu']:openMenu(toolMenu)
end)


------------------------------------------------------------------------------------------------------

-- parts crafting : check player has the items

RegisterNetEvent('rsg-lumberjack:client:componetcheckitems', function(data)
    RSGCore.Functions.TriggerCallback('rsg-lumberjack:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-lumberjack:client:startcomponetcrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.ComponetsCrafting[data.item].craftitems)
end)

RegisterNetEvent('rsg-lumberjack:client:toolscheckitems', function(data)
    RSGCore.Functions.TriggerCallback('rsg-lumberjack:server:checkitems', function(hasRequired)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('rsg-lumberjack:client:starttoolscrafting', data.name, data.lable, data.item, tonumber(data.crafttime), data.receive)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.ToolsCrafting[data.item].craftitems)
end)
-------------------------------------------------------------------------------------------------

-- start parts crafting

RegisterNetEvent('rsg-lumberjack:client:startcomponetcrafting', function(name, lable, item, crafttime, receive)
local craftitems = Config.ComponetsCrafting[item].craftitems
---------------------------------------------
local player = PlayerPedId()
local ped = PlayerPedId()
local currentPos = GetEntityCoords(ped)
--SetEntityCoords(ped, -765.0553, -1259.9515, 47.45, false, false, false, true)
--FreezeEntityPosition(PlayerPedId(), true)
local coords = GetEntityCoords(player)
local boneIndex = GetEntityBoneIndexByName(player, "SKEL_L_Hand")
local prop = CreateObject(GetHashKey("p_woodplane01x"), coords, true, true, true)
SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
FreezeEntityPosition(player, true)
ClearPedTasksImmediately(player)
AttachEntityToEntity(prop, player, boneIndex, 0.18, 0.09, -0.03, 111.0, 0.0, 254.0, true, false, true, false, 0, true)
local stemAnim1Dict2 = "amb_work@world_human_wood_plane@working@male_a@idle_a"
local stemAnim2 = "idle_b"
local LoadAnimDict = function(dict)

    local isLoaded = HasAnimDictLoaded(dict)

    while not isLoaded do
        RequestAnimDict(dict)
        Wait(5)
        isLoaded = not isLoaded
    end
end

LoadAnimDict(stemAnim1Dict2)
Wait(100)
TaskPlayAnim(player, stemAnim1Dict2, stemAnim2, 3.0, 3.0, 20000, 1, 0, false, false, false)
FreezeEntityPosition(player, true)

----------------------------
    RSGCore.Functions.Progressbar('craft-parts', ('Crafting..')..lable, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
------------------------------
        ClearPedTasks(player)
        ClearPedTasksImmediately(player)
        FreezeEntityPosition(player, false)
        SetEntityAsNoLongerNeeded(prop)
        DeleteEntity(prop)
        DeleteObject(prop)
        TriggerServerEvent('rsg-lumberjack:server:finishcrafting', craftitems, receive)
    end)
end)

RegisterNetEvent('rsg-lumberjack:client:starttoolscrafting', function(name, lable, item, crafttime, receive)
    local craftitems = Config.ToolsCrafting[item].craftitems
    ---------------------------------------------
    local player = PlayerPedId()
    local ped = PlayerPedId()
    local currentPos = GetEntityCoords(ped)
    --SetEntityCoords(ped, -765.0553, -1259.9515, 47.45, false, false, false, true)
    --FreezeEntityPosition(PlayerPedId(), true)
    local coords = GetEntityCoords(player)
    local boneIndex = GetEntityBoneIndexByName(player, "SKEL_R_Hand")
    local prop = CreateObject(GetHashKey("p_hammer02x"), coords, true, true, true)
    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
    FreezeEntityPosition(player, true)
    ClearPedTasksImmediately(player)
    AttachEntityToEntity(prop, player, boneIndex, 0.11, -0.06, -0.09, 64.0, 4.0, 175.0, true, false, true, false, 0, true)
    local stemAnim1Dict2 = "amb_work@world_human_hammer@ground@male_a@idle_b"
    local stemAnim2 = "idle_f"
    local LoadAnimDict = function(dict)
    
        local isLoaded = HasAnimDictLoaded(dict)
    
        while not isLoaded do
            RequestAnimDict(dict)
            Wait(5)
            isLoaded = not isLoaded
        end
    end
    
    LoadAnimDict(stemAnim1Dict2)
    Wait(100)
    TaskPlayAnim(player, stemAnim1Dict2, stemAnim2, 3.0, 3.0, 20000, 1, 0, false, false, false)
    FreezeEntityPosition(player, true)
    
    ----------------------------
        RSGCore.Functions.Progressbar('craft-parts', ('Crafting..')..lable, crafttime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
    ------------------------------
            ClearPedTasks(player)
            ClearPedTasksImmediately(player)
            FreezeEntityPosition(player, false)
            SetEntityAsNoLongerNeeded(prop)
            DeleteEntity(prop)
            DeleteObject(prop)
            TriggerServerEvent('rsg-lumberjack:server:finishcrafting', craftitems, receive)
        end)
    end)

-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------

RegisterNetEvent('rsg-lumberjack:client:storage', function()
    local playerjob = PlayerData.job.name
    if playerjob == currentjob then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", currentjob, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", currentjob)
    end
end)


-----------------------------------------------------------------------------------


-- For Ensure Command
AddEventHandler('onResourceStart', function()
    currentjob = RSGCore.Functions.GetPlayerData().job.name
end)

-- Cleanup
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    FreezeEntityPosition(PlayerPedId(), false)

    for i = 1, #createdEntries do
        if createdEntries[i].type == 'BLIP' then
            RemoveBlip(createdEntries[i].handle)
        end

        if createdEntries[i].type == 'PROMPT' then
            exports['rsg-core']:deletePrompt(createdEntries[i].handle)
        end
    end
end)