-- config.lua

_G.RuneHub.Config = {

    Version = "1.0.0",
    HubName = "Rune Hub",

    RarityOrder = {
        "Common", "Uncommon", "Rare", "Epic", "Legendary",
        "Secret", "Prismatic", "Divine", "Exotic", "Transcended",
    },

    RarityColors = {
        Common      = Color3.fromRGB(150, 150, 150),
        Uncommon    = Color3.fromRGB(34,  197, 94),
        Rare        = Color3.fromRGB(59,  130, 246),
        Epic        = Color3.fromRGB(168, 85,  247),
        Legendary   = Color3.fromRGB(234, 179, 8),
        Secret      = Color3.fromRGB(255, 100, 100),
        Prismatic   = Color3.fromRGB(0,   220, 220),
        Divine      = Color3.fromRGB(255, 200, 50),
        Exotic      = Color3.fromRGB(255, 120, 30),
        Transcended = Color3.fromRGB(255, 50,  50),
    },

    Theme = {
        Accent      = Color3.fromRGB(34,  197, 94),
        Background  = Color3.fromRGB(15,  15,  20),
        Surface     = Color3.fromRGB(25,  25,  32),
        TabBar      = Color3.fromRGB(20,  20,  28),
        Border      = Color3.fromRGB(50,  50,  60),
        TextPrimary = Color3.fromRGB(240, 240, 240),
        TextMuted   = Color3.fromRGB(120, 120, 130),
        Danger      = Color3.fromRGB(239, 68,  68),
        Warning     = Color3.fromRGB(234, 179, 8),
        Info        = Color3.fromRGB(99,  102, 241),
    },
}

-- init Toggles here so all tabs can access it immediately
_G.RuneHub.Toggles = {
    autoUnlockPlots  = false,
    autoUpgradeFarm  = false,
    autoSellCrates   = false,
    autoClaimRewards = false,
    autoRollSeeds    = false,
    autoPlant        = false,
    autoRemove       = false,
}

-- init rarity selection tables
_G.RuneHub.PlantRarities  = {}
_G.RuneHub.RemoveRarities = {}

_G.RuneHub.GetRarityLevel = function(rarity)
    for i, r in ipairs(_G.RuneHub.Config.RarityOrder) do
        if r == rarity then return i end
    end
    return 0
end

print("[Rune Hub] Config loaded")