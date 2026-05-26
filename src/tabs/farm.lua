-- tabs/farm.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes           = ReplicatedStorage:WaitForChild("Remotes")

local UnlockPlot  = Remotes:WaitForChild("UnlockPlot")
local UpgradeFarm = Remotes:WaitForChild("UpgradeFarm")
local SellCrates  = Remotes:WaitForChild("SellCrates")
local ClaimReward = Remotes:WaitForChild("ClaimPlaytimeReward")

local GUI   = _G.RuneHub.GUI
local Theme = _G.RuneHub.Config.Theme

local page = GUI.MakePage()
GUI.MakeTab("Farm", "⚙️", page)

GUI.MakeSection(page, "PLOTS")

GUI.MakeToggle(page, "Unlock all plots", "Auto unlocks every plot", "autoUnlockPlots", Theme.Accent, function()
    task.spawn(function()
        local plots = workspace:WaitForChild("Map"):WaitForChild("Plots")
        while _G.RuneHub.Toggles.autoUnlockPlots do
            for i = 1, 10 do
                if not _G.RuneHub.Toggles.autoUnlockPlots then break end
                local plot = plots:FindFirstChild("Plot" .. i)
                if not plot then continue end
                local farmPlot = plot:FindFirstChild("FarmPlot")
                if not farmPlot then continue end
                for _, innerPlot in pairs(farmPlot:GetChildren()) do
                    if not _G.RuneHub.Toggles.autoUnlockPlots then break end
                    local dirt = innerPlot:FindFirstChild("Dirt")
                    if not dirt then continue end
                    pcall(function() UnlockPlot:FireServer(dirt) end)
                    task.wait(0.5)
                end
            end
            task.wait(2)
        end
    end)
end)

GUI.MakeSection(page, "FARM")

GUI.MakeToggle(page, "Auto upgrade farm", "Keeps upgrading your farm", "autoUpgradeFarm", Color3.fromRGB(251, 146, 60), function()
    task.spawn(function()
        while _G.RuneHub.Toggles.autoUpgradeFarm do
            pcall(function() UpgradeFarm:InvokeServer() end)
            task.wait(0.5)
        end
    end)
end)

GUI.MakeSection(page, "ECONOMY")

GUI.MakeToggle(page, "Auto sell crates", "Sells crates automatically", "autoSellCrates", Color3.fromRGB(234, 179, 8), function()
    task.spawn(function()
        while _G.RuneHub.Toggles.autoSellCrates do
            pcall(function() SellCrates:FireServer() end)
            task.wait(1)
        end
    end)
end)

GUI.MakeToggle(page, "Auto claim rewards", "Claims all playtime rewards", "autoClaimRewards", Color3.fromRGB(168, 85, 247), function()
    task.spawn(function()
        while _G.RuneHub.Toggles.autoClaimRewards do
            for i = 1, 100 do
                if not _G.RuneHub.Toggles.autoClaimRewards then break end
                pcall(function() ClaimReward:InvokeServer(i) end)
                task.wait(0.5)
            end
            task.wait(2)
        end
    end)
end)

print("[Rune Hub] Farm tab loaded")