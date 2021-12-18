-- Add to QBCore/qb-smallresources/client/consumeables.lua

RegisterNetEvent('consumables:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    end)
end)

-- Note: This is already going to be in the File though, you can add things like(to gain benefits):
-- When adding these Events, you will want to put them after line 11, and before line 12(in this .lua)
TriggerServerEvent('hospital:server:SetArmor', math.random(5, 10))-- Will be a interval(chance) and won't increase past max math.random
-- OR --
TriggerServerEvent('hospital:server:SetArmor', 5)-- Will be a steady set(won't increase past x amount)


TriggerServerEvent('hud:Server:RelieveStress', math.random(8, 13)) -- Will change in intervals
-- OR --
TriggerServerEvent('hud:Server:RelieveStress', 5) -- Will be a steady decrease
