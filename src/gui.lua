-- gui.lua
-- Core hub UI framework — reusable for any game

local Players      = game:GetService("Players")
local player       = Players.LocalPlayer
local Theme        = _G.RuneHub.Config.Theme

-- destroy old gui
local old = player.PlayerGui:FindFirstChild("RuneHub")
if old then old:Destroy() end

-- state
local pages      = {}
local tabButtons = {}

-- init GUI table immediately so tabs can find it
_G.RuneHub.GUI = {}

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name            = "RuneHub"
screenGui.ResetOnSpawn    = false
screenGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder    = 999
screenGui.Parent          = player.PlayerGui

-- =====================
-- SHOW / HIDE BUTTON
-- =====================
local showBtn = Instance.new("TextButton")
showBtn.Size                = UDim2.new(0, 100, 0, 30)
showBtn.Position            = UDim2.new(0, 10, 0, 10)
showBtn.BackgroundColor3    = Theme.Accent
showBtn.TextColor3          = Color3.fromRGB(255, 255, 255)
showBtn.Text                = "Rune Hub"
showBtn.Font                = Enum.Font.GothamBold
showBtn.TextSize            = 11
showBtn.BorderSizePixel     = 0
showBtn.ZIndex              = 100
showBtn.Parent              = screenGui
Instance.new("UICorner", showBtn).CornerRadius = UDim.new(0, 8)

-- =====================
-- MAIN FRAME
-- =====================
local frame = Instance.new("Frame")
frame.Size              = UDim2.new(0, 300, 0, 430)
frame.Position          = UDim2.new(0, 10, 0, 48)
frame.BackgroundColor3  = Theme.Background
frame.BorderSizePixel   = 0
frame.Active            = true
frame.Draggable         = true
frame.ZIndex            = 9
frame.Parent            = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- =====================
-- TITLE BAR
-- =====================
local titleBar = Instance.new("Frame")
titleBar.Size             = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Theme.Accent
titleBar.BorderSizePixel  = 0
titleBar.ZIndex           = 10
titleBar.Parent           = frame
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 12)

local titleFix = Instance.new("Frame")
titleFix.Size             = UDim2.new(1, 0, 0, 12)
titleFix.Position         = UDim2.new(0, 0, 1, -12)
titleFix.BackgroundColor3 = Theme.Accent
titleFix.BorderSizePixel  = 0
titleFix.Parent           = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size                   = UDim2.new(1, -80, 1, 0)
titleLabel.Position               = UDim2.new(0, 14, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3             = Color3.fromRGB(255, 255, 255)
titleLabel.Text                   = _G.RuneHub.Config.HubName
titleLabel.Font                   = Enum.Font.GothamBold
titleLabel.TextSize               = 15
titleLabel.TextXAlignment         = Enum.TextXAlignment.Left
titleLabel.Parent                 = titleBar

local versionLabel = Instance.new("TextLabel")
versionLabel.Size                   = UDim2.new(0, 40, 0, 16)
versionLabel.Position               = UDim2.new(1, -100, 0.5, -8)
versionLabel.BackgroundTransparency = 1
versionLabel.TextColor3             = Color3.fromRGB(255, 255, 255)
versionLabel.TextTransparency       = 0.4
versionLabel.Text                   = "v" .. _G.RuneHub.Config.Version
versionLabel.Font                   = Enum.Font.Gotham
versionLabel.TextSize               = 10
versionLabel.Parent                 = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Size                   = UDim2.new(0, 24, 0, 24)
minBtn.Position               = UDim2.new(1, -54, 0.5, -12)
minBtn.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
minBtn.BackgroundTransparency = 0.7
minBtn.TextColor3             = Color3.fromRGB(255, 255, 255)
minBtn.Text                   = "-"
minBtn.Font                   = Enum.Font.GothamBold
minBtn.TextSize               = 11
minBtn.BorderSizePixel        = 0
minBtn.ZIndex                 = 20
minBtn.Parent                 = titleBar
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

local closeBtn = Instance.new("TextButton")
closeBtn.Size             = UDim2.new(0, 24, 0, 24)
closeBtn.Position         = UDim2.new(1, -26, 0.5, -12)
closeBtn.BackgroundColor3 = Theme.Danger
closeBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
closeBtn.Text             = "X"
closeBtn.Font             = Enum.Font.GothamBold
closeBtn.TextSize         = 11
closeBtn.BorderSizePixel  = 0
closeBtn.ZIndex           = 20
closeBtn.Parent           = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- =====================
-- TAB BAR
-- =====================
local tabBar = Instance.new("Frame")
tabBar.Size             = UDim2.new(1, 0, 0, 34)
tabBar.Position         = UDim2.new(0, 0, 0, 40)
tabBar.BackgroundColor3 = Theme.TabBar
tabBar.BorderSizePixel  = 0
tabBar.Parent           = frame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection       = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
tabLayout.VerticalAlignment   = Enum.VerticalAlignment.Center
tabLayout.Padding             = UDim.new(0, 0)
tabLayout.Parent              = tabBar

local tabPad = Instance.new("UIPadding")
tabPad.PaddingLeft = UDim.new(0, 6)
tabPad.Parent      = tabBar

-- =====================
-- CONTENT AREA
-- =====================
local contentArea = Instance.new("Frame")
contentArea.Size                = UDim2.new(1, 0, 1, -80)
contentArea.Position            = UDim2.new(0, 0, 0, 80)
contentArea.BackgroundTransparency = 1
contentArea.ClipsDescendants    = true
contentArea.Parent              = frame

-- =====================
-- STATUS BAR
-- =====================
local statusBar = Instance.new("Frame")
statusBar.Size             = UDim2.new(1, 0, 0, 24)
statusBar.Position         = UDim2.new(0, 0, 1, -24)
statusBar.BackgroundColor3 = Theme.TabBar
statusBar.BorderSizePixel  = 0
statusBar.Parent           = frame

local statusDot = Instance.new("Frame")
statusDot.Size             = UDim2.new(0, 6, 0, 6)
statusDot.Position         = UDim2.new(0, 10, 0.5, -3)
statusDot.BackgroundColor3 = Theme.Accent
statusDot.BorderSizePixel  = 0
statusDot.Parent           = statusBar
Instance.new("UICorner", statusDot).CornerRadius = UDim.new(1, 0)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size                   = UDim2.new(1, -20, 1, 0)
statusLabel.Position               = UDim2.new(0, 20, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3             = Theme.TextMuted
statusLabel.Text                   = "Ready"
statusLabel.Font                   = Enum.Font.Gotham
statusLabel.TextSize               = 10
statusLabel.TextXAlignment         = Enum.TextXAlignment.Left
statusLabel.Parent                 = statusBar

local vLabel = Instance.new("TextLabel")
vLabel.Size                   = UDim2.new(0, 100, 1, 0)
vLabel.Position               = UDim2.new(1, -104, 0, 0)
vLabel.BackgroundTransparency = 1
vLabel.TextColor3             = Theme.TextMuted
vLabel.Text                   = _G.RuneHub.Config.HubName .. " v" .. _G.RuneHub.Config.Version
vLabel.Font                   = Enum.Font.Gotham
vLabel.TextSize               = 10
vLabel.TextXAlignment         = Enum.TextXAlignment.Right
vLabel.Parent                 = statusBar

-- =====================
-- BUTTON LOGIC
-- =====================
local isMinimized = false

minBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    contentArea.Visible = not isMinimized
    tabBar.Visible      = not isMinimized
    statusBar.Visible   = not isMinimized
    if isMinimized then
        frame.Size  = UDim2.new(0, 300, 0, 40)
        minBtn.Text = "+"
    else
        frame.Size  = UDim2.new(0, 300, 0, 430)
        minBtn.Text = "-"
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    if _G.RuneHub.Toggles then
        for k in pairs(_G.RuneHub.Toggles) do
            _G.RuneHub.Toggles[k] = false
        end
    end
    frame.Visible = false
    showBtn.Text  = _G.RuneHub.Config.HubName
    showBtn.BackgroundColor3 = Theme.Accent
end)

showBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    if frame.Visible then
        showBtn.Text             = "Hide Hub"
        showBtn.BackgroundColor3 = Theme.Danger
    else
        showBtn.Text             = _G.RuneHub.Config.HubName
        showBtn.BackgroundColor3 = Theme.Accent
    end
end)

-- =====================
-- PUBLIC API
-- =====================
_G.RuneHub.GUI.UpdateStatus = function(text)
    statusLabel.Text = text
end

_G.RuneHub.GUI.MakePage = function()
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size                 = UDim2.new(1, 0, 1, -24)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel      = 0
    scroll.ScrollBarThickness   = 3
    scroll.ScrollBarImageColor3 = Theme.Accent
    scroll.CanvasSize           = UDim2.new(0, 0, 0, 0)
    scroll.AutomaticCanvasSize  = Enum.AutomaticSize.Y
    scroll.Visible              = false
    scroll.Parent               = contentArea

    local layout = Instance.new("UIListLayout")
    layout.Padding             = UDim.new(0, 6)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Parent              = scroll

    local pad = Instance.new("UIPadding")
    pad.PaddingTop    = UDim.new(0, 8)
    pad.PaddingBottom = UDim.new(0, 8)
    pad.Parent        = scroll

    table.insert(pages, scroll)
    return scroll
end

_G.RuneHub.GUI.MakeTab = function(name, icon, page)
    local tab = Instance.new("TextButton")
    tab.Size             = UDim2.new(0, 72, 0, 34)
    tab.BackgroundColor3 = Theme.TabBar
    tab.TextColor3       = Theme.TextMuted
    tab.Text             = icon .. " " .. name
    tab.Font             = Enum.Font.GothamBold
    tab.TextSize         = 10
    tab.BorderSizePixel  = 0
    tab.Parent           = tabBar

    local indicator = Instance.new("Frame")
    indicator.Size             = UDim2.new(1, -8, 0, 2)
    indicator.Position         = UDim2.new(0, 4, 1, -2)
    indicator.BackgroundColor3 = Theme.Accent
    indicator.BorderSizePixel  = 0
    indicator.Visible          = false
    indicator.Parent           = tab
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(0, 2)

    table.insert(tabButtons, {btn = tab, page = page, indicator = indicator})

    tab.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        for _, t in pairs(tabButtons) do
            t.btn.TextColor3       = Theme.TextMuted
            t.btn.BackgroundColor3 = Theme.TabBar
            t.indicator.Visible    = false
        end
        page.Visible           = true
        tab.TextColor3         = Color3.fromRGB(255, 255, 255)
        tab.BackgroundColor3   = Color3.fromRGB(30, 30, 42)
        indicator.Visible      = true
    end)

    return tab
end

_G.RuneHub.GUI.MakeToggle = function(page, label, desc, toggleKey, accentColor, onEnable)
    local container = Instance.new("Frame")
    container.Size             = UDim2.new(0, 276, 0, 58)
    container.BackgroundColor3 = Theme.Surface
    container.BorderSizePixel  = 0
    container.Parent           = page
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

    local accent = Instance.new("Frame")
    accent.Size             = UDim2.new(0, 3, 1, -16)
    accent.Position         = UDim2.new(0, 8, 0, 8)
    accent.BackgroundColor3 = Theme.Border
    accent.BorderSizePixel  = 0
    accent.Parent           = container
    Instance.new("UICorner", accent).CornerRadius = UDim.new(0, 2)

    local lbl = Instance.new("TextLabel")
    lbl.Size                  = UDim2.new(0, 170, 0, 20)
    lbl.Position              = UDim2.new(0, 20, 0, 9)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3            = Theme.TextPrimary
    lbl.Text                  = label
    lbl.Font                  = Enum.Font.GothamBold
    lbl.TextSize              = 12
    lbl.TextXAlignment        = Enum.TextXAlignment.Left
    lbl.Parent                = container

    local descLbl = Instance.new("TextLabel")
    descLbl.Size                  = UDim2.new(0, 170, 0, 16)
    descLbl.Position              = UDim2.new(0, 20, 0, 30)
    descLbl.BackgroundTransparency = 1
    descLbl.TextColor3            = Theme.TextMuted
    descLbl.Text                  = desc
    descLbl.Font                  = Enum.Font.Gotham
    descLbl.TextSize              = 10
    descLbl.TextXAlignment        = Enum.TextXAlignment.Left
    descLbl.Parent                = container

    local pill = Instance.new("TextButton")
    pill.Size             = UDim2.new(0, 44, 0, 22)
    pill.Position         = UDim2.new(1, -52, 0.5, -11)
    pill.BackgroundColor3 = Theme.Border
    pill.TextColor3       = Theme.TextMuted
    pill.Text             = "OFF"
    pill.Font             = Enum.Font.GothamBold
    pill.TextSize         = 9
    pill.BorderSizePixel  = 0
    pill.Parent           = container
    Instance.new("UICorner", pill).CornerRadius = UDim.new(0, 11)

    pill.MouseButton1Click:Connect(function()
        _G.RuneHub.Toggles[toggleKey] = not _G.RuneHub.Toggles[toggleKey]
        if _G.RuneHub.Toggles[toggleKey] then
            pill.BackgroundColor3   = accentColor
            pill.TextColor3         = Color3.fromRGB(255, 255, 255)
            pill.Text               = "ON"
            accent.BackgroundColor3 = accentColor
            onEnable()
            _G.RuneHub.GUI.UpdateStatus(label .. " enabled")
        else
            pill.BackgroundColor3   = Theme.Border
            pill.TextColor3         = Theme.TextMuted
            pill.Text               = "OFF"
            accent.BackgroundColor3 = Theme.Border
            _G.RuneHub.GUI.UpdateStatus(label .. " disabled")
        end
    end)
end

_G.RuneHub.GUI.MakeAction = function(page, label, desc, accentColor, onClick)
    local container = Instance.new("Frame")
    container.Size             = UDim2.new(0, 276, 0, 58)
    container.BackgroundColor3 = Theme.Surface
    container.BorderSizePixel  = 0
    container.Parent           = page
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

    local accent = Instance.new("Frame")
    accent.Size             = UDim2.new(0, 3, 1, -16)
    accent.Position         = UDim2.new(0, 8, 0, 8)
    accent.BackgroundColor3 = accentColor
    accent.BorderSizePixel  = 0
    accent.Parent           = container
    Instance.new("UICorner", accent).CornerRadius = UDim.new(0, 2)

    local lbl = Instance.new("TextLabel")
    lbl.Size                  = UDim2.new(0, 170, 0, 20)
    lbl.Position              = UDim2.new(0, 20, 0, 9)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3            = Theme.TextPrimary
    lbl.Text                  = label
    lbl.Font                  = Enum.Font.GothamBold
    lbl.TextSize              = 12
    lbl.TextXAlignment        = Enum.TextXAlignment.Left
    lbl.Parent                = container

    local descLbl = Instance.new("TextLabel")
    descLbl.Size                  = UDim2.new(0, 170, 0, 16)
    descLbl.Position              = UDim2.new(0, 20, 0, 30)
    descLbl.BackgroundTransparency = 1
    descLbl.TextColor3            = Theme.TextMuted
    descLbl.Text                  = desc
    descLbl.Font                  = Enum.Font.Gotham
    descLbl.TextSize              = 10
    descLbl.TextXAlignment        = Enum.TextXAlignment.Left
    descLbl.Parent                = container

    local btn = Instance.new("TextButton")
    btn.Size             = UDim2.new(0, 50, 0, 22)
    btn.Position         = UDim2.new(1, -58, 0.5, -11)
    btn.BackgroundColor3 = accentColor
    btn.TextColor3       = Color3.fromRGB(255, 255, 255)
    btn.Text             = "RUN"
    btn.Font             = Enum.Font.GothamBold
    btn.TextSize         = 9
    btn.BorderSizePixel  = 0
    btn.Parent           = container
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseButton1Click:Connect(function()
        btn.Text             = "..."
        btn.BackgroundColor3 = Theme.Border
        _G.RuneHub.GUI.UpdateStatus("Running: " .. label)
        task.spawn(function()
            onClick()
            task.wait(1)
            btn.Text             = "RUN"
            btn.BackgroundColor3 = accentColor
            _G.RuneHub.GUI.UpdateStatus("Done: " .. label)
        end)
    end)
end

_G.RuneHub.GUI.MakeSection = function(page, text)
    local lbl = Instance.new("TextLabel")
    lbl.Size                  = UDim2.new(0, 276, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3            = Theme.TextMuted
    lbl.Text                  = text
    lbl.Font                  = Enum.Font.GothamBold
    lbl.TextSize              = 10
    lbl.TextXAlignment        = Enum.TextXAlignment.Left
    lbl.Parent                = page

    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 8)
    pad.Parent      = lbl
end

_G.RuneHub.GUI.MakeRaritySelector = function(page, labelText, selectedKey)
    local cfg = _G.RuneHub.Config

    local header = Instance.new("TextLabel")
    header.Size                  = UDim2.new(0, 276, 0, 18)
    header.BackgroundTransparency = 1
    header.TextColor3            = cfg.Theme.TextMuted
    header.Text                  = labelText
    header.Font                  = Enum.Font.GothamBold
    header.TextSize              = 10
    header.TextXAlignment        = Enum.TextXAlignment.Left
    header.Parent                = page

    local headerPad = Instance.new("UIPadding")
    headerPad.PaddingLeft = UDim.new(0, 8)
    headerPad.Parent      = header

    local container = Instance.new("Frame")
    container.Size             = UDim2.new(0, 276, 0, 86)
    container.BackgroundColor3 = cfg.Theme.Surface
    container.BorderSizePixel  = 0
    container.Parent           = page
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

    local grid = Instance.new("UIGridLayout")
    grid.CellSize            = UDim2.new(0, 80, 0, 22)
    grid.CellPadding         = UDim2.new(0, 4, 0, 4)
    grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
    grid.VerticalAlignment   = Enum.VerticalAlignment.Center
    grid.Parent              = container

    local pad = Instance.new("UIPadding")
    pad.PaddingTop    = UDim.new(0, 6)
    pad.PaddingBottom = UDim.new(0, 6)
    pad.Parent        = container

    if not _G.RuneHub[selectedKey] then
        _G.RuneHub[selectedKey] = {}
    end

    for _, rarity in ipairs(cfg.RarityOrder) do
        local rbtn = Instance.new("TextButton")
        rbtn.Size             = UDim2.new(0, 80, 0, 22)
        rbtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        rbtn.TextColor3       = cfg.RarityColors[rarity] or Color3.fromRGB(200, 200, 200)
        rbtn.Text             = rarity
        rbtn.Font             = Enum.Font.GothamBold
        rbtn.TextSize         = 9
        rbtn.BorderSizePixel  = 0
        rbtn.Parent           = container
        Instance.new("UICorner", rbtn).CornerRadius = UDim.new(0, 6)

        if _G.RuneHub[selectedKey][rarity] then
            rbtn.BackgroundColor3 = cfg.RarityColors[rarity]
            rbtn.TextColor3       = Color3.fromRGB(255, 255, 255)
        end

        rbtn.MouseButton1Click:Connect(function()
            _G.RuneHub[selectedKey][rarity] = not _G.RuneHub[selectedKey][rarity]
            if _G.RuneHub[selectedKey][rarity] then
                rbtn.BackgroundColor3 = cfg.RarityColors[rarity]
                rbtn.TextColor3       = Color3.fromRGB(255, 255, 255)
            else
                rbtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                rbtn.TextColor3       = cfg.RarityColors[rarity] or Color3.fromRGB(200, 200, 200)
            end
        end)
    end
end

_G.RuneHub.GUI.ActivateFirstTab = function()
    if #tabButtons > 0 then
        local first = tabButtons[1]
        for _, p in pairs(pages) do p.Visible = false end
        for _, t in pairs(tabButtons) do
            t.btn.TextColor3       = Theme.TextMuted
            t.btn.BackgroundColor3 = Theme.TabBar
            t.indicator.Visible    = false
        end
        first.page.Visible          = true
        first.btn.TextColor3        = Color3.fromRGB(255, 255, 255)
        first.btn.BackgroundColor3  = Color3.fromRGB(30, 30, 42)
        first.indicator.Visible     = true
    end
end

print("[Rune Hub] GUI framework loaded")