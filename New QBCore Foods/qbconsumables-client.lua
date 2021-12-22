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

-- Adding Armor Event
TriggerServerEvent('hospital:server:SetArmor', math.random(5, 10))-- Will be a interval(chance) and won't increase past max math.random
-- OR --
TriggerServerEvent('hospital:server:SetArmor', 5)-- Will be a steady set(won't increase past x amount)

-- Relieving Stress Event
TriggerServerEvent('hud:server:RelieveStress', math.random(8, 13)) -- Will change in intervals
-- OR --
TriggerServerEvent('hud:server:RelieveStress', 5) -- Will be a steady decrease

-- Causing a "High" Event
TriggerEvent("evidence:client:SetStatus", "widepupils", math.random(70, 80) -- Will have a if/or chance
-- OR --
TriggerEvent("evidence:client:SetStatus", "widepupils", 200) -- Will be a steady set

-- Causing a "Drunk" Event
-- "Regularly" Drunk
TriggerEvent("evidence:client:SetStatus", "alcohol", math.random(20, 200) -- Will change in intervals
-- OR --
TriggerEvent("evidence:client:SetStatus", "alcohol", 200) -- Will be a steady set
-- "Heavy" Drunk
TriggerEvent("evidence:client:SetStatus", "heavyalcohol", math.random(20, 200) -- Will change in intervals
-- OR --
TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200) -- Will be a steady set
-- Though, if you wish to have the "Drunk" show up at a Certain level of "Drunk" than you'd do:
if alcoholCount > 1 and alcoholCount < 2 then
-- This can be used in sense of doing 1-2(regular drunk), and 3 and above(heavy drunk)

-- Causing a "Speed" Event
TriggerEvent("evidence:client:SetStatus", "agitated", math.random(20, 300) -- Will change in intervals
-- OR --
TriggerEvent("evidence:client:SetStatus", "agitated", 300) -- Will be a steady set