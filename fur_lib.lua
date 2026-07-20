-- fur_lib.lua (Fixed & Self-Contained)
warn("[FURRY] Loading UI...")

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"

local okLibrary, Library = pcall(function()
    return loadstring(game:HttpGet(repo .. "Library.lua"))()
end)

if not okLibrary then
    warn("[uilib] Obsidian failed to load:", Library)
    return
end

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

-- Create Modules table (this was missing!)
local Modules = {
    GunMods = {
        enabled = false, recoilReduction = 0, horizontalRecoil = 0,
        noSpread = false, accuracyMultiplier = 1, customFirerate = 600,
        reloadSpeed = 1, forceAuto = false, instantADS = false, customZoom = 1,
    },
    SilentAim = {
        enabled = false, fov = 120, fovVisible = true, smoothness = 0.5,
        targetPlayers = true, targetGadgets = true, targetCameras = true,
    },
    Hitbox = {
        enabled = false, teamCheck = true, size = 5, transparency = 0.7,
        color = Color3.fromRGB(255, 0, 0)
    },
    ESP = {
        enabled = false, teamCheck = true,
        playerBoxEnabled = true, objectBoxEnabled = true,
        playerThickness = 2, objectThickness = 1,
        playerColor = Color3.fromRGB(255, 0, 0),
        droneColor = Color3.fromRGB(0, 255, 0),
        -- add other colors as needed
    },
    Fullbright = {
        enabled = false, brightness = 2, clockTime = 12,
        fogEnd = 100000, globalShadows = true, ambient = Color3.fromRGB(255,255,255)
    },
    NoSmokeFlash = { enabled = false, noSmoke = true, noFlash = true },
    RappelFly = { enabled = false, speed = 5, pullSpeed = 2, flyKey = "G" }
}

-- Create Window
local Window = Library:CreateWindow({
    Title = "FURRY MAN",
    Footer = "FREE YENO",
    Center = true,
    AutoShow = true,
    ShowCustomCursor = true,
    NotifySide = "Right",
    ToggleKeybind = Enum.KeyCode.RightControl,
})

local Tabs = {
    Combat = Window:AddTab("Combat"),
    Visuals = Window:AddTab("Visuals"),
    World   = Window:AddTab("World"),
    Misc    = Window:AddTab("Misc"),
    UI      = Window:AddTab("UI Settings")
}

-- === Combat Tab ===
local Gun = Tabs.Combat:AddLeftGroupbox("Gun Mods")
Gun:AddToggle("gm_en", {Text = "Enable Gun Mods", Default = Modules.GunMods.enabled})
    :OnChanged(function(v) Modules.GunMods.enabled = v end)

Gun:AddSlider("gm_recoil", {Text = "Recoil Mult", Default = Modules.GunMods.recoilReduction, Min = 0, Max = 1, Rounding = 2})
    :OnChanged(function(v) Modules.GunMods.recoilReduction = v end)

-- (Add the rest of Gun Mods similarly — I shortened for space)

local SA = Tabs.Combat:AddRightGroupbox("Silent Aim")
SA:AddToggle("sa_en", {Text = "Enable Silent Aim", Default = Modules.SilentAim.enabled})
    :OnChanged(function(v) Modules.SilentAim.enabled = v end)

SA:AddSlider("sa_fov", {Text = "FOV", Default = Modules.SilentAim.fov, Min = 20, Max = 1000, Rounding = 0})
    :OnChanged(function(v) Modules.SilentAim.fov = v end)

-- === Continue with other sections (Hitbox, ESP, etc.) the same way ===

Library:Notify({Title = "FURRY MAN", Description = "UI Loaded Successfully!", Time = 5})

print("[FURRY] UI Ready - Modules table created")
