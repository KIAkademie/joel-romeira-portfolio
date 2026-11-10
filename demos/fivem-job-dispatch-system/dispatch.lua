-- FiveM Server/Client Dispatch Script
-- Author: Joel Neto Romeira

RegisterNetEvent("jnr_dispatch:newCall")
AddEventHandler("jnr_dispatch:newCall", function(jobName, callerName, coords, message)
    local callData = {
        id = math.random(1000, 9999),
        job = jobName,
        caller = callerName,
        x = coords.x,
        y = coords.y,
        message = message,
        status = "Offen"
    }
    TriggerClientEvent("jnr_dispatch:receiveCall", -1, callData)
end)

RegisterNUICallback("acceptDispatch", function(data, cb)
    SetNewWaypoint(data.x, data.y)
    TriggerServerEvent("jnr_dispatch:updateStatus", data.id, "Angenommen")
    cb("ok")
end)
