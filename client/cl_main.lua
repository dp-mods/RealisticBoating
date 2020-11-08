anchored = false


Citizen.CreateThread(function()


    while true do


        Citizen.Wait(5)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local vehicleClass = GetVehicleClass(vehicle)


        if vehicleClass == 14 or vehicleClass == 18 then -- Checks that the vehicle class is a boat
      
            if IsEntityInWater(vehicle) then -- Checks if vehicles in water
			    if IsControlJustPressed(1, 74) and anchored == false then 
				local speed = GetVehicleDashboardSpeed(vehicle)
				
				if speed < 6 then 

					-- If it is a boat and the speed is less than 6 and the anchor isn't set then set it
			 
					print('Lowering the anchor')
				if Config.UsePNotify then
					exports.pNotify:SendNotification({
						text = "<b style='color:yellow'>Loweing the anchor</b><br />",
						type = "success",
						queue = "error",
						timeout = 5000,
						layout = "bottomRight",
						sounds = {
							sources = {"sound-example.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
							volume = 0.2,
							conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
						}
					})
				end
					Citizen.Wait(5000) -- Added a wait time to signify that it takes 5 seconds to lower the anchor
                SetBoatAnchor(vehicle, true) -- Don't touch
                SetBoatFrozenWhenAnchored(vehicle, true) -- Don't touch
         
                exports.pNotify:SendNotification({
                    text = "<b style='color:green'>Anchor Lowered!</b><br />",
                    type = "success",
                    queue = "error",
                    timeout = 2000,
                    layout = "bottomRight",
                    sounds = {
                        sources = {"sound-example.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
                        volume = 0.2,
                        conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
                    }
                })
            
				anchored = true -- Remember client side that we anchored the boat

				else 
						-- If we can't anchor, it's because we're moving too quickly (Above 6)
							if Config.UsePNotify then
					exports.pNotify:SendNotification({
						text = "<b style='color:red'>You can only do that while stationary</b><br />",
						type = "error",
						queue = "error",
						timeout = 5000,
						layout = "bottomRight",
						sounds = {
							sources = {"sound-example.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
							volume = 0.2,
							conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
						}
					})
								
				end
				
				end 
            

            elseif IsControlJustPressed(1, 74) and anchored == true then

				print('Raising the anchor')
			if Config.UsePNotify then
				exports.pNotify:SendNotification({
                    text = "<b style='color:green'>Raising the anchor</b><br />",
                    type = "success",
                    queue = "error",
                    timeout = 5000,
                    layout = "bottomRight",
                    sounds = {
                        sources = {"sound-example.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
                        volume = 0.2,
                        conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
                    }
                })
		
                Citizen.Wait(5000)
						
                exports.pNotify:SendNotification({
                    text = "<b style='color:green'>Anchor raised!</b><br />",
                    type = "success",
                    queue = "error",
                    timeout = 2000,
                    layout = "bottomRight",
                    sounds = {
                        sources = {"sound-example.wav"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
                        volume = 0.2,
                        conditions = {"docVisible"} -- This means it will play the sound when the notification becomes visible.
                    }
                })
		end
                SetBoatAnchor(vehicle, false)
                SetBoatFrozenWhenAnchored(vehicle, false)


                anchored = false
                
            else 

				Citizen.Wait(10)
				

            end

        end 
      
	end
		

    end 

end)
