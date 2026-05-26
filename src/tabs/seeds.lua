-- tabs/seeds.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes           = ReplicatedStorage:WaitForChild("Remotes")
local RollSeeds = Remotes:WaitForChild("RollSeeds")
local BuySeed   = Remotes:WaitForChild("BuySeed")

local GUI   = _G.RuneHub.GUI
local Theme = _G.RuneHub.Config.Theme

local SEED_ID = 1

local page = GUI.MakePage()
GUI.MakeTab("Seeds", "🌱", page)

GUI.MakeSection(page, "AUTO ROLL & BUY")

GUI.MakeToggle(page, "Roll & buy seeds", "Rolls then buys seed ID " .. SEED_ID, "autoRollSeeds", Color3.fromRGB(20, 184, 166), function()
    task.spawn(function()
        while _G.RuneHub.Toggles.autoRollSeeds do
            pcall(function() RollSeeds:FireServer() end)
            task.wait(0.5)
            pcall(function() BuySeed:FireServer(SEED_ID) end)
            task.wait(1)
        end
    end)
end)

GUI.MakeSection(page, "AUTO PLANT — SELECT RARITIES")

GUI.MakeRaritySelector(page, "Click rarities to plant:", "PlantRarities")

GUI.MakeToggle(page, "Auto plant seeds", "Plants only selected rarities", "autoPlant", Theme.Accent, function()
    task.spawn(function()
        local Plants    = require(game.ReplicatedStorage.Shared.Registry.Plants)
        local PlantSeed = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlantSeed")
        while _G.RuneHub.Toggles.autoPlant do
            local list = Plants.GetPlantsForIndex()
            for i, plant in ipairs(list) do
                if not _G.RuneHub.Toggles.autoPlant then break end
                if _G.RuneHub.PlantRarities[plant.Rarity] then
                    pcall(function() PlantSeed:FireServer(i) end)
                    print("[Rune Hub] Planted: " .. plant.Name .. " (" .. plant.Rarity .. ")")
                    task.wait(0.5)
                end
            end
            task.wait(2)
        end
    end)
end)

print("[Rune Hub] Seeds tab loaded")