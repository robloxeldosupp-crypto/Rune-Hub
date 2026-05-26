-- main.lua
-- Ties everything together, activates first tab

-- init global toggles table
_G.RuneHub.Toggles = {
    autoUnlockPlots = false,
    autoUpgradeFarm = false,
    autoSellCrates  = false,
    autoClaimRewards = false,
    autoRollSeeds   = false,
    autoPlant       = false,
    autoRemove      = false,
}

-- activate first tab
_G.RuneHub.GUI.ActivateFirstTab()

_G.RuneHub.GUI.UpdateStatus("Ready")

print("[Rune Hub] All systems go — " .. _G.RuneHub.Config.HubName .. " v" .. _G.RuneHub.Config.Version)