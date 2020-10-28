anchored = false


Citizen.CreateThread(function()


    while true do


        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local vehicleClass = GetVehicleClass(vehicle)


        if vehicleClass == 14 then 
      
            if IsControlJustPressed(1, 74) and anchored == false then 

                SetForcedBoatLocationWhenAnchored(vehicle, true)
                SetBoatAnchor(vehicle, true)
                SetBoatFrozenWhenAnchored(vehicle, true)
         
                 -- You could trigger a notification here
            
                anchored = true
            

            elseif IsControlJustPressed(1, 74) and anchored == true then

                SetBoatAnchor(vehicle, false)
                SetForcedBoatLocationWhenAnchored(vehicle, false)
                SetBoatFrozenWhenAnchored(vehicle, false)

           -- You could trigger a notification here

                anchored = false

            end
      
        end

    end 

end)



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

        local currentvehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local lastvehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local currentvehicleClass = GetVehicleClass(currentvehicle)
        local lastvehicleClass = GetVehicleClass(lastvehicle)

        if currentvehicleClass == 14 then


             SetBoatSinksWhenWrecked(currentvehicle, true)
        
        elseif lastvehicleClass == 14 then

      
            SetBoatSinksWhenWrecked(lastvehicle, true)

        else

            Citizen.Wait(10000)

        end

    end

end)