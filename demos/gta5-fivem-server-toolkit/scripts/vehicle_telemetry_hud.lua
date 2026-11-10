-- ============================================================================
-- GTA 5 / FiveM Custom Vehicle Telemetry & Garage Sync Script
-- Author: Joel Neto Romeira
-- Description: Liest Fahrzeug-Telemetrie in Echtzeit aus, sendet Werte an das
--              HTML/JS-Overlay (NUI) und speichert Fahrzeugzustände in SQL.
-- ============================================================================

local isHudActive = false
local lastSavedPlate = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local playerPed = PlayerPedId()

        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speedKmh = math.floor(GetEntitySpeed(vehicle) * 3.6)
            local rpm = GetVehicleCurrentRpm(vehicle)
            local fuel = GetVehicleFuelLevel(vehicle)
            local engineHealth = math.floor(GetVehicleEngineHealth(vehicle) / 10)
            local gear = GetVehicleCurrentGear(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)

            isHudActive = true
            SendNUIMessage({
                action = "updateVehicleHud",
                speed = speedKmh,
                rpm = rpm,
                fuel = math.floor(fuel),
                engine = engineHealth,
                gear = gear,
                plate = plate
            })
        elseif isHudActive then
            isHudActive = false
            SendNUIMessage({ action = "hideVehicleHud" })
        end
    end
end)

-- Server-Callback zum Speichern des Fahrzeugzustands in der SQL-Datenbank
RegisterCommand("savecar", function()
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local props = {
            plate = GetVehicleNumberPlateText(vehicle),
            fuel = math.floor(GetVehicleFuelLevel(vehicle)),
            engineHealth = math.floor(GetVehicleEngineHealth(vehicle)),
            bodyHealth = math.floor(GetVehicleBodyHealth(vehicle))
        }
        TriggerServerEvent("jnr_garage:saveVehicleState", props)
    end
end, false)
