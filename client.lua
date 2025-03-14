local QBCore = exports['qb-core']:GetCoreObject()
local spawned = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			if PlayerData.job.name == "pizzeria" then
				TriggerServerEvent("QBCore:ToggleDuty")
			end
		end
	end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent("sync-pizzeria:client:Service", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)


-- Blips
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(462.2, -693.88, 26.44)
    
    SetBlipSprite (blip, 59)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.7)
    SetBlipColour (blip, 2)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Ingredients Seller')
    EndTextCommandSetBlipName(blip)

    local blip = AddBlipForCoord(806.3805, -761.1523, 31.2659)
    
    SetBlipSprite (blip, 389)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.9)
    SetBlipColour (blip, 1)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Pizzeria')
    EndTextCommandSetBlipName(blip)
end)


RegisterNetEvent('sync-pizzeria:client:FoodMenu', function() 
    exports['qb-menu']:openMenu({
        {
            header = "Foods pizzeria",
            isMenuHeader = true,
        },
        {
            header = "< Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Tomato Sauce",
            txt = "Ingredients: <br> - 1 Salt <br> - 1 Tomato",
            params = {
                event = "sync-pizzeria:client:MakeTSauce",
            }
        },
        {
            header = "Pizza Base",
            txt = "Ingredients: <br> - 1 Dough <br> - 1 Tomato Sauce",
            params = {
                event = "sync-pizzeria:client:MakePizzaBase",
            }
        },
        {
            header = "fungi pizzeria",
            txt = "Ingredients: <br> - 1 Water <br> - 1 Butter <br> - 1 Flour <br> - 1 Mushroom <br> - 1 Pizza Base",
            params = {
                event = "sync-pizzeria:client:MakePizzaFungi",
            }
        },
        {
            header = "Veg Pizza",
            txt = "Ingredients: <br> - 1 Water <br> - 1 Butter <br> - 1 Flour <br> - 1 Veg Cheese <br> - 1 Tomato <br> - 1 Pizza Base",
            params = {
                event = "sync-pizzeria:client:MakeVegPizza",
            }
        },
        {
            header = "Napollitano Pizza",
            txt = "Ingredients: <br> - 1 Water <br> - 1 Butter <br> - 1 Flour <br> - 1 Pizza Base",
            params = {
                event = "sync-pizzeria:client:MakeNapoPizza",
            }
        },
        {
            header = "Margharita Pizza",
            txt = "Ingredients: <br> - 1 Water <br> - 1 Cheese <br> - 1 Butter <br> - 1 Pizza Base",
            params = {
                event = "sync-pizzeria:client:MakeMargharitaPizza",
            }
        },
        {
            header = "Seafood Pizza",
            txt = "Ingredients: <br> - 1 Avocado <br> - 1 Seafood <br> - 1 Tuna <br> - 1 Nori <br> - 1 Pizza Base",
            params = {
                event = "sync-pizzeria:client:MakeSeafoodPizza",
            }
        },
    })
end)

RegisterNetEvent('sync-pizzeria:client:DrinkMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Drinks Pizzeria",
            isMenuHeader = true,
        },
        {
            header = "< Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Berry Blue B-T",
            txt = "Ingredients: <br> - 1 BerryBlue Essence <br> - 1 Water Bottle <br> - 1 Tapioka Balls",
            params = {
                event = "sync-pizzeria:client:MakeBubbleTeaBlue",
            }
        },
        {
            header = "Minty B-T",
            txt = "Ingredients: <br> - 1 Mint Essence <br> - 1 Water Bottle <br> - 1 Tapioka Balls",
            params = {
                event = "sync-pizzeria:client:MakeBubbleTeaMint",
            }
        },
    })
end)

RegisterNetEvent('sync-pizzeria:client:ShopMenu', function()
    if Config.UsePed == true then
    exports['qb-menu']:openMenu({
        {
            header = "Ingredients",
            isMenuHeader = true,
        },
        {
            header = "< Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Butter",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyButter",
            }
        },
        {
            header = "Flour",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyFlour",
            }
        },
        {
            header = "TapiokaBalls",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyTapioka",
            }
        },
        {
            header = "Nori",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyNori",
            }
        },
        {
            header = "Mint Essence",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyMintEssence",
            }
        },
        {
            header = "Blue Essence",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyBlueEssence",
            }
        },
        {
            header = "Avocado",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyAvocado",
            }
        },
        {
            header = "Tuna",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyTuna",
            }
        },
        {
            header = "Salt",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuySalt",
            }
        },
        {
            header = "Veg Cheese",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyVegCheese",
            }
        },
        {
            header = "Cheese",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyCheese",
            }
        },
        {
            header = "Mushroom",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyMushroom",
            }
        },
        {
            header = "Dough",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyDough",
            }
        },
        {
            header = "Tomato",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyTomato",
            }
        },
        {
            header = "Seafood",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuySeafood",
            }
        },
        {
            header = "Watter Bottle",
            txt = "Price: 10x per 20$",
            params = {
                event = "sync-pizzeria:client:BuyWater",
            }
        },
    })
    end
end)

RegisterNetEvent('sync-pizzeria:client:MakeTSauce', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar('tsauce', 'MAKING T SAUCE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakeTSauce')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakePizzaBase', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar('MakePizzaBase', 'MAKING A PIZZA BASE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakePizzaBase')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakePizzaFungi', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar('pizzafungi', 'MAKING A FUNGI PIZZA...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakePizzaFungi')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakeVegPizza', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar('vegpizza', 'MAKING A VEG PIZZA...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakeVegPizza')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakeNapoPizza', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar('napopizza', 'MAKING A NAPO PIZZA...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakeNapoPizza')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakeMargharitaPizza', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar('margpizza', 'MAKING A MARG PIZZA...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakeMargharitaPizza')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakeSeafoodPizza', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    QBCore.Functions.Progressbar('seafoodpizza', 'MAKING A SEA PIZZA...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakeSeafoodPizza')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakeBubbleTeaBlue', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pizzabubbleteablueberry', 'TAKING A BLUE BT...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakeBubbleTeaBlue')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:MakeBubbleTeaMint', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pizzabubbleteamint', 'TAKING A MINT BT...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('sync-pizzeria:server:MakeBubbleTeaMint')
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:FridgeFood', function() 
    TriggerEvent("inventory:client:SetCurrentStash", "pizzeriafridge")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizzeriafridge", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent('sync-pizzeria:client:RefrigeratorIngredients', function() 
    TriggerEvent("inventory:client:SetCurrentStash", "refrigeratoringredients")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "refrigeratoringredients", {
        maxweight = 500000,
        slots = 40,
    })
end)

RegisterNetEvent('sync-pizzeria:client:Counter', function() 
    TriggerEvent("inventory:client:SetCurrentStash", "counterpizzeria")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "counterpizzeria", {
        maxweight = 10000,
        slots = 40,
    })
end)

RegisterNetEvent('sync-pizzeria:client:board1', function() 
    TriggerEvent("inventory:client:SetCurrentStash", "pizzeriaboard1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizzeriaboard1", {
        maxweight = 20000,
        slots = 10,
    })
end)

RegisterNetEvent('sync-pizzeria:client:board2', function() 
    TriggerEvent("inventory:client:SetCurrentStash", "pizzeriaboard2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "pizzeriaboard2", {
        maxweight = 20000,
        slots = 10,
    })
end)

function DoRequestAnimSet(anim)
	RequestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Citizen.Wait(1)
	end
end

RegisterNetEvent('sync-pizzeria:client:EatPizzaFungi', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    QBCore.Functions.Progressbar('pizzafungi', 'EATING A FUNGI PIZZA...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(40, 70))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:EatVegPizza', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    QBCore.Functions.Progressbar('vegpizza', 'EATING A VEG PIZZA...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(40, 70))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:EatNapoPizza', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    QBCore.Functions.Progressbar('napopizza', 'EATING A NAPO PIZZA...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(40, 70))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:EatMargharitaPizza', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    QBCore.Functions.Progressbar('margpizza', 'EATING A MARG PIZZA...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(40, 70))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:EatSeafoodPizza', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    QBCore.Functions.Progressbar('seafoodpizza', 'EATING A SEAFOOD PIZZA...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(40, 70))
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent('sync-pizzeria:client:DrinkBubbleTeaBlue', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"bubbletea"})
    QBCore.Functions.Progressbar('pizzabubbleteablueberry', 'DRINKING A BLUE BT ...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30, 50))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('hud:server:RelieveStress', math.random(20, 40))
    end)
end)

RegisterNetEvent('sync-pizzeria:client:DrinkBubbleTeaMint', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"bubbletea"})
    QBCore.Functions.Progressbar('pizzabubbleteamint', 'DRINKING A MINT BT...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30, 50))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('hud:server:RelieveStress', math.random(10, 30))
    end)
end)

RegisterNetEvent('sync-pizzeria:client:DrinkDrPepper', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"bubbletea"})
    QBCore.Functions.Progressbar('pizzadrpepper', 'DRINKING A DR PEPPER...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30, 50))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('hud:server:RelieveStress', math.random(10, 30))
    end)
end)

RegisterNetEvent('sync-pizzeria:client:DrinkSprite', function() 
    TriggerEvent('animations:client:EmoteCommandStart', {"bubbletea"})
    QBCore.Functions.Progressbar('pizzasprite', 'DRINKING A DRINKSPRITE...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30, 50))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('hud:server:RelieveStress', math.random(10, 30))
    end)
end)

local IngredientsPed = {
    Config.Ped
}

Citizen.CreateThread(function()
    if Config.UsePed == true then
    for _,v in pairs(IngredientsPed) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end
        IngredientsProcPed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
        SetEntityHeading(IngredientsProcPed, v[5])
        FreezeEntityPosition(IngredientsProcPed, true)
        SetEntityInvincible(IngredientsProcPed, true)
        SetBlockingOfNonTemporaryEvents(IngredientsProcPed, true)
        TaskStartScenarioInPlace(IngredientsProcPed, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT", 0, true) 
        end
    end
end)

Citizen.CreateThread(function()
    if Config.ox_target then
        if Config.UsePed == true then
            exports.ox_target:addBoxZone({
                coords = vec3(801.7924, -757.6255, 25.7808),
                size = vec3(2, 2, 2),
                rotation = 45,
                debug = drawZones,
                options = {
                    {
                        name = 'ingredientped',
                        event = 'sync-pizzeria:client:ShopMenu',
                        icon = 'fa-solid fa-cube',
                        label = 'Talk with employee'
                    }
                }
            })
        end
    else
        exports['qb-target']:AddBoxZone("PedIngredients", Config.PedTargetLoc, 1, 1, {
            name = "PedIngredients",
            heading = 0,
            debugPoly = false,
        }, {
            options = {
                {
                    type = "Client",
                    event = "sync-pizzeria:client:ShopMenu",
                    icon = "fas fa-shopping-bag",
                    label = 'Talk with employee'
                },
            },
            distance = 2.5
        })
    end
end)


RegisterNetEvent('sync-pizzeria:client:BuyButter', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_butter', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzabutter", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyFlour', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_flour', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzaflour", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyTapioka', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_tapioka', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "tapiokaballs", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyNori', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_nori', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "nori", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyMintEssence', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_mintessence', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzamintessence", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyBlueEssence', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_blueessence', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzabbessence", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyAvocado', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_avocado', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "avocado", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyTuna', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_tuna', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzatuna", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuySalt', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_salt', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzasalt", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyVegCheese', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_vegcheese', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzavegcheese", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyCheese', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_cheese', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzacheese", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyMushroom', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_mushroom', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzamushroom", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyDough', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_dough', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzadough", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuyTomato', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_tomato', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzatomatoes", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)

RegisterNetEvent('sync-pizzeria:client:BuySeafood', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_seafood', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "pizzaseafoodmix", 10)
        TriggerServerEvent('sync-pizzeria:server:Take20Dollars')
    end)
end)


RegisterNetEvent('sync-pizzeria:client:BuyWater', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('buy_water', 'PAYING...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sync-pizzeria:Server:AddItem', "water_bottle", 10)
        TriggerServerEvent('sync-pizzeria:server:Take30Dollars')
    end)
end)

RegisterNetEvent("sync-pizzeria:client:SeeMenu", function()
    exports['qb-menu']:openMenu({
        {
            header = "Menu Pizzeria",
            isMenuHeader = true,
        },
        {
            header = "< Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Drinks",
            txt = "See the drinks available in our pizzeria!",
            params = {
                event = "sync-pizzeria:client:DrinkMenu",
            }
        },
        {
            header = "Foods",
            txt = "See what foods are available in our pizzeria!",
            params = {
                event = "sync-pizzeria:client:FoodMenu",
            }
        },
    })
end)

RegisterNetEvent('sync-pizzeria:client:Menu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Drinks Pizzeria",
            isMenuHeader = true,
        },
        {
            header = "< Back",
            txt = "",
            params = {
                event = "sync-pizzeria:client:SeeMenu",
            }
        },
        {
            header = "Blueberry Bubble Tea",
            txt = "Price: 75$",
            params = {
                event = "sync-pizzeria:client:DrinkMenu",
            }
        },
        {
            header = "Mint Bubble Tea",
            txt = "Price: 75$",
            params = {
                event = "sync-pizzeria:client:DrinkMenu",
            }
        },
    })
end)

RegisterNetEvent('sync-pizzeria:client:Menu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Foods Pizzeria",
            isMenuHeader = true,
        },
        {
            header = "< Back",
            txt = "",
            params = {
                event = "sync-pizzeria:client:SeeMenu",
            }
        },
        {
            header = "Pizza Fungi",
            txt = "Price: 75$",
            params = {
                event = "sync-pizzeria:client:FoodMenu",
            }
        },
        {
            header = "Veg Pizza",
            txt = "Price: 75$",
            params = {
                event = "sync-pizzeria:client:FoodMenu",
            }
        },
        {
            header = "Napo Pizza",
            txt = "Price: 75$",
            params = {
                event = "sync-pizzeria:client:FoodMenu",
            }
        },
        {
            header = "Margharita Pizza",
            txt = "Price: 75$",
            params = {
                event = "sync-pizzeria:client:FoodMenu",
            }
        },
        {
            header = "Seafood Pizza",
            txt = "Price: 75$",
            params = {
                event = "sync-pizzeria:client:FoodMenu",
            }
        },
    })
end)

RegisterCommand('menu-pizzeria', function()
    TriggerEvent('sync-pizzeria:client:SeeMenu')
end)

RegisterNetEvent("sync-pizzeria:client:BillPlayer", function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Bill",
        submitText = "Bill Player",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'paypal id'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$ amount!'
            }
        }
    })
    if dialog then
        if not dialog.id or not dialog.amount then return end
        TriggerServerEvent("sync-pizzeria:server:BillPlayer", dialog.id, dialog.amount)
    end
end)

