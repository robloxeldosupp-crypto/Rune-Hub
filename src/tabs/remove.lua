-- tabs/remove.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemovePlant = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RemovePlant")
local Plants      = require(game.ReplicatedStorage.Shared.Registry.Plants)

local GUI   = _G.RuneHub.GUI
local Theme = _G.RuneHub.Config.Theme

local page = GUI.MakePage()
GUI.MakeTab("Remove", "🗑️", page)

GUI.MakeSection(page, "SELECT RARITIES TO REMOVE")

GUI.MakeRaritySelector(page, "Click rarities to remove:", "RemoveRarities")

GUI.MakeSection(page, "AUTO REMOVE")

GUI.MakeToggle(page, "Auto remove plants", "Removes only selected rarities", "autoRemove", Theme.Danger, function()
    task.spawn(function()
        while _G.RuneHub.Toggles.autoRemove do
            local plots = workspace:WaitForChild("Map"):WaitForChild("Plots")
            for i = 1, 10 do
                if not _G.RuneHub.Toggles.autoRemove then break end
                local plot = plots:FindFirstChild("Plot" .. i)
                if not plot then continue end
                local farmPlot = plot:FindFirstChild("FarmPlot")
                if not farmPlot then continue end
                for _, innerPlot in pairs(farmPlot:GetChildren()) do
                    if not _G.RuneHub.Toggles.autoRemove then break end
                    local dirt = innerPlot:FindFirstChild("Dirt")
                    if not dirt then continue end
                    for _, plant in pairs(dirt:GetChildren()) do
                        if not _G.RuneHub.Toggles.autoRemove then break end
                        local list = Plants.GetPlantsForIndex()
                        for _, p in ipairs(list) do
                            if p.Name == plant.Name then
                                if _G.RuneHub.RemoveRarities[p.Rarity] then
                                    pcall(function() RemovePlant:FireServer(dirt) end)
                                    print("[Rune Hub] Removed: " .. plant.Name .. " (" .. p.Rarity .. ")")
                                    task.wait(0.3)
                                end
                                break
                            end
                        end
                    end
                end
            end
            task.wait(2)
        end
    end)
end)

print("[Rune Hub] Remove tab loaded")