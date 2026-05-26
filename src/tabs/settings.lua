-- tabs/settings.lua

local TeleportService = game:GetService("TeleportService")
local Players         = game:GetService("Players")
local player          = Players.LocalPlayer

local GUI   = _G.RuneHub.GUI
local Theme = _G.RuneHub.Config.Theme

local page = GUI.MakePage()
local tab  = GUI.MakeTab("Settings", "⚙️", page)

GUI.MakeSection(page, "GAME")

GUI.MakeAction(page,
    "Rejoin",
    "Rejoin the current server",
    Theme.Danger,
    function()
        TeleportService:Teleport(game.PlaceId, player)
    end
)

GUI.MakeAction(page,
    "Re-execute hub",
    "Destroys and reloads the hub",
    Theme.Info,
    function()
        local old = player.PlayerGui:FindFirstChild("RuneHub")
        if old then old:Destroy() end
        print("[Rune Hub] Re-executing...")
        -- re-run loader if you have it stored
        if _G.RuneHubLoader then
            _G.RuneHubLoader()
        end
    end
)

GUI.MakeSection(page, "TOGGLES")

GUI.MakeAction(page,
    "Stop all",
    "Disables every active toggle",
    Color3.fromRGB(251, 146, 60),
    function()
        for k in pairs(_G.RuneHub.Toggles) do
            _G.RuneHub.Toggles[k] = false
        end
        GUI.UpdateStatus("All toggles stopped")
        print("[Rune Hub] All toggles stopped")
    end
)

GUI.MakeSection(page, "INFO")

-- version info card
local infoCard = Instance.new("Frame")
infoCard.Size             = UDim2.new(0, 276, 0, 58)
infoCard.BackgroundColor3 = Theme.Surface
infoCard.BorderSizePixel  = 0
infoCard.Parent           = page
Instance.new("UICorner", infoCard).CornerRadius = UDim.new(0, 10)

local infoLabel = Instance.new("TextLabel")
infoLabel.Size                  = UDim2.new(1, -16, 1, 0)
infoLabel.Position              = UDim2.new(0, 12, 0, 0)
infoLabel.BackgroundTransparency = 1
infoLabel.TextColor3            = Theme.TextMuted
infoLabel.Text                  = _G.RuneHub.Config.HubName .. "  •  v" .. _G.RuneHub.Config.Version .. "\nBuilt for Roblox executor scripting"
infoLabel.Font                  = Enum.Font.Gotham
infoLabel.TextSize              = 10
infoLabel.TextXAlignment        = Enum.TextXAlignment.Left
infoLabel.TextWrapped           = true
infoLabel.Parent                = infoCard

print("[Rune Hub] Settings tab loaded")