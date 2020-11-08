

CreateThread(function()
     while true do
    Wait(10)

    -- More realistic waves. Set to false in the config if its not to your suiting
    if Config.ImprovedWaterConditions then 

        WaterOverrideSetStrength(Config.WaveIntensity)

    end 
    -- See the config to disable/enable. This is if you want to expand the GTA boundary and allow people to travel further out into the water
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


    if Config.SinkWhenSubmerged then -- Should be self explanatory to what this does 
    if submerged >= Config.SubmergmentRate then 

     if Config.UsePNotify then 
        exports.pNotify:SendNotification({
            text = "<b style='color:white'>Distress Signal Activated: Boat Sinking</b><br />",
            type = "success",
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

       
    
            Citizen.Wait(10000)
     
          SetBoatSinking(vehicle)

    
    
        end 
          Citizen.Wait(10)
    end

    
    end
end)
