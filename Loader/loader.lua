-- Rune Hub Loader
-- Paste only this file into your executor

local BASE_URL = "https://raw.githubusercontent.com/robloxeldosupp-crypto/Rune-Hub/main/src/"

local FILES = {
    "config",
    "gui",
    "tabs/farm",
    "tabs/seeds",
    "tabs/remove",
    "tabs/settings",
    "main",
}

_G.RuneHub = {}

print("[Rune Hub] Loading...")

for _, file in ipairs(FILES) do
    local ok, err = pcall(function()
        local code = game:HttpGet(BASE_URL .. file .. ".lua")
        local fn, loadErr = loadstring(code)
        if not fn then
            error("Parse error in " .. file .. ": " .. tostring(loadErr))
        end
        fn()
    end)
    if ok then
        print("[Rune Hub] Loaded: " .. file)
    else
        warn("[Rune Hub] Failed: " .. file .. " | " .. tostring(err))
    end
end

print("[Rune Hub] Ready!")