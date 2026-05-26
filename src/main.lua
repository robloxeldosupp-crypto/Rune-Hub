-- main.lua

_G.RuneHub.Toggles = {
    autoUnlockPlots  = false,
    autoUpgradeFarm  = false,
    autoSellCrates   = false,
    autoClaimRewards = false,
    autoRollSeeds    = false,
    autoPlant        = false,
    autoRemove       = false,
}

_G.RuneHub.GUI.ActivateFirstTab()
_G.RuneHub.GUI.UpdateStatus("Ready")

print("[Rune Hub] All systems go — " .. _G.RuneHub.Config.HubName .. " v" .. _G.RuneHub.Config.Version)