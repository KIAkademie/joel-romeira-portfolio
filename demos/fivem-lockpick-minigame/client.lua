-- FiveM Client Script: Lockpick NUI Minigame
-- Author: Joel Neto Romeira

local isMinigameOpen = false
local currentCallback = nil

function StartLockpickMinigame(pins, cb)
    if isMinigameOpen then return end
    isMinigameOpen = true
    currentCallback = cb
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "startLockpick",
        pins = pins or 4
    })
end

RegisterNUICallback("lockpickResult", function(data, cb)
    SetNuiFocus(false, false)
    isMinigameOpen = false
    if currentCallback then
        currentCallback(data.success)
        currentCallback = nil
    end
    cb("ok")
end)

RegisterCommand("testlockpick", function()
    StartLockpickMinigame(4, function(success)
        if success then
            TriggerEvent("chat:addMessage", { args = { "[Lockpick]", "Schloss erfolgreich geöffnet!" } })
        else
            TriggerEvent("chat:addMessage", { args = { "[Lockpick]", "Dietrich abgebrochen!" } })
        end
    end)
end, false)

exports("StartLockpickMinigame", StartLockpickMinigame)
