local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------

-- check player has items
RSGCore.Functions.CreateCallback('rsg-lumberjack:server:checkitems', function(source, cb, craftitems)
    local src = source
    local hasItems = false
    local icheck = 0
    local Player = RSGCore.Functions.GetPlayer(src)
    for k, v in pairs(craftitems) do
        if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.amount then
            icheck = icheck + 1
            if icheck == #craftitems then
                cb(true)
            end
        else
            TriggerClientEvent('RSGCore:Notify', src, Lang:t('error.you_dont_have_the_required_items'), 'error')
            cb(false)
            return
        end
    end
end)

-----------------------------------------------------------------------------------

-- finish crafting
RegisterServerEvent('rsg-lumberjack:server:finishcrafting')
AddEventHandler('rsg-lumberjack:server:finishcrafting', function(craftitems, receive)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    -- remove craftitems
    for k, v in pairs(craftitems) do
        if Config.Debug == true then
            print(v.item)
            print(v.amount)
        end
        Player.Functions.RemoveItem(v.item, v.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[v.item], "remove")
    end
    -- add items
    Player.Functions.AddItem(receive, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[receive], "add")
    --TriggerClientEvent('rsg-lumberjack:client:stopanim', source)
end)

-----------------------------------------------------------------------------------

RSGCore.Functions.CreateUseableItem("sapkit", function(source)
    TriggerClientEvent("rsg-lumberjack:client:sap",source)
end)

RegisterServerEvent('rsg-lumberjack:server:removesap')
AddEventHandler('rsg-lumberjack:server:removesap', function ()
local src = source
local Player = RSGCore.Functions.GetPlayer(src)
Player.Functions.RemoveItem("sapkit", 1)
TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items["sapkit"], "remove")
Player.Functions.RemoveItem("bucket", 1)
TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items["bucket"], "remove")
end)

RegisterServerEvent('rsg-lumberjack:server:sap100')
AddEventHandler('rsg-lumberjack:server:sap100', function ()
local src = source
local Player = RSGCore.Functions.GetPlayer(src)
Player.Functions.AddItem("sap", 200)
TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items["sap"], "add")
TriggerClientEvent('rsg-lumberjack:client:removetarget', src)
end)

