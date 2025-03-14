Citizen.CreateThread(function()
    if Config.OxTarget then
        exports.ox_target:addBoxZone({
            coords = vec3(795.13, -766.72, 31.08),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'pizzeria-service',
                    event = 'sync-pizzeria:client:Service',
                    icon = 'far fa-clipboard',
                    label = 'Clock in/out',
                }
            }
        })


        exports.ox_target:addBoxZone({
            coords = vec3(813.1639, -756.1667, 27.7808),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'counterpizzeria',
                    event = 'sync-pizzeria:client:Counter',
                    icon = 'far fa-clipboard',
                    label = 'Counter',
                }
            }
        })
    


        exports.ox_target:addBoxZone({
            coords = vec3(810.8437, -754.0417, 27.0317),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'pizzeriaboard1',
                    event = 'sync-pizzeria:client:board1',
                    icon = 'far fa-clipboard',
                    label = 'Board',
                }
            }
        })
    
        exports.ox_target:addBoxZone({
            coords = vec3(810.8372, -749.7289, 27.0317),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                name = 'pizzeriaboard2',
                event = 'sync-pizzeria:client:board2',
                icon = 'far fa-clipboard',
                label = 'Board',
                }
            }
        })   
    
        exports.ox_target:addBoxZone({
            coords = vec3(805.6757, -761.2631, 26.9249),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'pizzeriafridge',
                    event = 'sync-pizzeria:client:RefrigeratorIngredients',
                    icon = 'fas fa-laptop',
                    label = 'Food Storage',
                    job = 'pizzeria',
                }
            }
        }) 

        exports.ox_target:addBoxZone({
            coords = vec3(814.2353, -752.9790, 28.0090),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'pizzeria-foods',
                    event = 'sync-pizzeria:client:FoodMenu',
                    icon = 'fas fa-rocket',
                    label = 'Get SUM FOOD',
                    job = 'pizzeria',
                }
            }
        }) 
    
        exports.ox_target:addBoxZone({
            coords = vec3(810.8198, -752.1732, 27.0317),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'pizzeria-menu1',
                    event = 'sync-pizzeria:client:SeeMenu',
                    icon = 'fas fa-clipboard',
                    label = 'See Menu',
                },
                {
                    name = 'pizzeria-menu1',
                    event = 'sync-pizzeria:client:BillPlayer',
                    icon = 'fas fa-clipboard',
                    label = 'Bill Player',
                    job = 'pizzeria',
                }
            }
        }) 
    
            exports.ox_target:addBoxZone({
                coords = vec3(810.8151, -750.6937, 27.0317),
                size = vec3(2, 2, 2),
                rotation = 45,
                debug = drawZones,
                options = {
                    {
                        name = 'pizzeria-menu2',
                        event = 'sync-pizzeria:client:SeeMenu',
                        icon = 'fas fa-clipboard',
                        label = 'See Menu',
                    },
                    {
                        name = 'pizzeria-menu2',
                        event = 'sync-pizzeria:client:BillPlayer',
                        icon = 'fas fa-clipboard',
                        label = 'Bill Player',
                        job = 'pizzeria',
                    }
                }
            }) 
 
        exports.ox_target:addBoxZone({
            coords = vec3(813.4752, -749.1071, 26.7808),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'pizzeria-drinks',
                    event = 'sync-pizzeria:client:DrinkMenu',
                    icon = 'far fa-coffee',
                    label = 'Use Drinks Machine',
                    job = 'pizzeria',
                }
            } 
        }) 

        exports.ox_target:addBoxZone({
            coords = vec3(813.8384, -762.2818, 31.2659),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = drawZones,
            options = {
                {
                    name = 'pizzeria-clothes',
                    event = 'qb-clothing:client:openOutfitMenu',
                    icon = 'far fa-tshirt',
                    label = 'Change Clothes',
                }
            }
        }) 
    else
        exports['qb-target']:AddBoxZone("pizzeria-service", vector3(795.13, -766.72, 31.08), 1, 1.2, {
            name = "pizzeria-service",
            heading = 91,
            debugpoly = false,
            minZ=30.08,
            maxZ=32.08,
        }, {
            options = {
                {  
                event = "sync-pizzeria:client:Service",
                icon = "far fa-clipboard",
                label = "Clock in/out",
                job = "pizzeria",
                },
            },
            distance = 1.5
        })
    
        exports['qb-target']:AddBoxZone("counterpizzeria", vector3(813.1639, -756.1667, 27.7808), 1.6, 3.6, {
            name="counterpizzeria",
            heading=89,
            debugpoly = false,
        }, {
            options = {
                {
                event = "sync-pizzeria:client:Counter",
                icon = "far fa-clipboard",
                label = "Counter",
                },
            },
            distance = 3.5
        })
    
        exports['qb-target']:AddBoxZone("pizzeriaboard1", vector3(810.8437, -754.0417, 27.0317), 0.5, 0.7, {
            name = "pizzeriaboard1",
            heading = 87.8,
            debugpoly = false,
        }, {
            options = {
                {
                event = "sync-pizzeria:client:board1",
                icon = "far fa-clipboard",
                label = "Board",
                },
            },
            distance = 1.5
        })
    
        exports['qb-target']:AddBoxZone("pizzeriaboard2", vector3(810.8372, -749.7289, 27.0317), 0.5, 0.7, {
            name="pizzeriaboard2",
            heading=87.8,
            debugpoly = false,
        }, {
            options = {
                {
                event = "sync-pizzeria:client:board2",
                icon = "far fa-clipboard",
                label = "Board",
                },
            },
            distance = 1.5
        })
    
        exports['qb-target']:AddBoxZone("pizzeriafridge", vector3(805.6757, -761.2631, 26.9249), 1.6, 1, {
            name="pizzeriafridge",
            heading=89.0,
            debugpoly = false,
        }, {
                options = {
                    {
                        event = "sync-pizzeria:client:RefrigeratorIngredients",
                        icon = "fas fa-laptop",
                        label = "Food Storage",
                        job = "pizzeria",
                    },
                },
                distance = 1.0
            })
    
        exports['qb-target']:AddBoxZone("pizzeria-foods", vector3(814.2353, -752.9790, 28.0090), 0.7, 1.5, {
            name="pizzeria-foods",
            heading=97.15,
            debugPoly=false,
    
        }, {
                options = {
                    {
                        event = "sync-pizzeria:client:FoodMenu",
                        icon = "fas fa-rocket",
                        label = "Get SUM FOOD",
                        job = "pizzeria",
                    },
                },
                distance = 1.5
            })
    
        exports['qb-target']:AddBoxZone("pizzeria-menu1", vector3(810.8198, -752.1732, 27.0317), 0.5, 0.4, {
            name="pizzeria-menu1",
            debugpoly = false,
            heading=270,
        }, {
                options = {
                    {
                        event = "sync-pizzeria:client:SeeMenu",
                        icon = "fas fa-clipboard",
                        label = "See Menu",
                    },
                    {
                        event = "sync-pizzeria:client:BillPlayer",
                        icon = "fas fa-clipboard",
                        label = "Bill Player",
                        job = "pizzeria",
                    },
                },
                distance = 1.5
            })
    
        exports['qb-target']:AddBoxZone("pizzeria-menu2", vector3(810.8151, -750.6937, 27.0317), 0.6, 0.5, {
            name="pizzeria-menu2",
            debugpoly = false,
            heading=270,
            }, {
                    options = {
                        {
                            event = "sync-pizzeria:client:SeeMenu",
                            icon = "fas fa-clipboard",
                            label = "See Menu",
                        },
                        {
                            event = "sync-pizzeria:client:BillPlayer",
                            icon = "fas fa-clipboard",
                            label = "Bill Player",
                            job = "pizzeria",
                        },
                    },
                    distance = 1.5
                })
                
        
        exports['qb-target']:AddBoxZone("pizzeria-drinks", vector3(813.4752, -749.1071, 26.7808), 1, 1, {
            name="pizzeria-drinks",
            heading=0,
            debugpoly = false,
        }, {
            options = {
                {
                event = "sync-pizzeria:client:DrinkMenu",
                icon = "far fa-coffee",
                label = "Use Drinks Machine",
                job = "pizzeria",
                },
            },
            distance = 1.5
        })
    
        exports['qb-target']:AddBoxZone("pizzeria-clothes", vector3(813.8384, -762.2818, 31.2659), 1.5, 1, {
            name="pizzeria-clothes",
            heading=0,
            debugpoly = false,
        }, {
            options = {
                {
                event = "qb-clothing:client:openOutfitMenu",
                icon = "far fa-tshirt",
                label = "Change Clothes",
                },
            },
            distance = 1.5
        })

    end
end)