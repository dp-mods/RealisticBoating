-- See the config to disable/enable. This is if you want to expand the GTA boundary and allow people to travel further out into the water

CreateThread(function()
     while true do
    Wait(10)


    if Config.ImprovedWaterConditions then 

        WaterOverrideSetStrength(2.225)

    end 
    
    if Config.ExpandOceanLimit then
    
        ExpandWorldLimits(
            -9000.0,
            -11000.0,
            30.0
        )  
        ExpandWorldLimits(
            10000.0,
            12000.0,
            30.0
        ) 
        Wait(50)
    end


    if Config.SinkWhenSubmerged then 
    if submerged >= 1 then 

     if Config.UsePNotify then 
        exports.pNotify:SendNotification({
            text = "<b style='color:white'>Distress Signal Activated: Boat Sinking</b><br />",
            type = "error",
            queue = "error",
            timeout = 5000,
            layout = "topRight",
            sounds = {
                sources = {"sound-example.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
                volume = 0.2,
                conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
            }
        })
       end 

       
       SetVehicleEngineHealth(vehicle, 20)
       SetVehicleEngineOn(vehicle, false, true, true)
        Citizen.Wait(300000)
        SetBoatSinking(vehicle)

    
         else 
    
        Citizen.Wait(10)
    
          end 

    end


    end
end)
