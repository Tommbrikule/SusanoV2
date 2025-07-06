local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Susano",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Susano...",
   LoadingSubtitle = "by B4u3r",
   ShowText = "Susano", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "red", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "susano"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Susano Keys",
      Subtitle = "Key System",
      Note = "Enter your key", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/Rru3FVC4"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- TABS
local MainTab = Window:CreateTab("Main", nil) -- Title, Image

-- SELECTION
local MainSection = MainTab:CreateSection("Main")

-- NOTIFY
Rayfield:Notify({
   Title = "Join Disord!",
   Content = "disord.gg/link",
   Duration = 5,
   Image = nil,
})

-- BUTTONS,TOGGLE
local Toggle = MainTab:CreateToggle({
   Name = "Skeleton",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local Camera = game:GetService("Workspace").CurrentCamera

local function DrawLine()
    local l = Drawing.new("Line")
    l.Visible = false
    l.From = Vector2.new(0, 0)
    l.To = Vector2.new(1, 1)
    l.Color = Color3.fromRGB(255, 0, 0)
    l.Thickness = 1
    l.Transparency = 1
    return l
end

local function DrawESP(plr)
    repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil
    local limbs = {}
    local R15 = (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15) and true or false
    if R15 then 
        limbs = {
            -- Spine
            Head_UpperTorso = DrawLine(),
            UpperTorso_LowerTorso = DrawLine(),
            -- Left Arm
            UpperTorso_LeftUpperArm = DrawLine(),
            LeftUpperArm_LeftLowerArm = DrawLine(),
            LeftLowerArm_LeftHand = DrawLine(),
            -- Right Arm
            UpperTorso_RightUpperArm = DrawLine(),
            RightUpperArm_RightLowerArm = DrawLine(),
            RightLowerArm_RightHand = DrawLine(),
            -- Left Leg
            LowerTorso_LeftUpperLeg = DrawLine(),
            LeftUpperLeg_LeftLowerLeg = DrawLine(),
            LeftLowerLeg_LeftFoot = DrawLine(),
            -- Right Leg
            LowerTorso_RightUpperLeg = DrawLine(),
            RightUpperLeg_RightLowerLeg = DrawLine(),
            RightLowerLeg_RightFoot = DrawLine(),
        }
    else 
        limbs = {
            Head_Spine = DrawLine(),
            Spine = DrawLine(),
            LeftArm = DrawLine(),
            LeftArm_UpperTorso = DrawLine(),
            RightArm = DrawLine(),
            RightArm_UpperTorso = DrawLine(),
            LeftLeg = DrawLine(),
            LeftLeg_LowerTorso = DrawLine(),
            RightLeg = DrawLine(),
            RightLeg_LowerTorso = DrawLine()
        }
    end
    local function Visibility(state)
        for i, v in pairs(limbs) do
            v.Visible = state
        end
    end

    local function Colorize(color)
        for i, v in pairs(limbs) do
            v.Color = color
        end
    end

    local function UpdaterR15()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 then
                local HUM, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then
                    -- Head
                    local H = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                    if limbs.Head_UpperTorso.From ~= Vector2.new(H.X, H.Y) then
                        --Spine
                        local UT = Camera:WorldToViewportPoint(plr.Character.UpperTorso.Position)
                        local LT = Camera:WorldToViewportPoint(plr.Character.LowerTorso.Position)
                        -- Left Arm
                        local LUA = Camera:WorldToViewportPoint(plr.Character.LeftUpperArm.Position)
                        local LLA = Camera:WorldToViewportPoint(plr.Character.LeftLowerArm.Position)
                        local LH = Camera:WorldToViewportPoint(plr.Character.LeftHand.Position)
                        -- Right Arm
                        local RUA = Camera:WorldToViewportPoint(plr.Character.RightUpperArm.Position)
                        local RLA = Camera:WorldToViewportPoint(plr.Character.RightLowerArm.Position)
                        local RH = Camera:WorldToViewportPoint(plr.Character.RightHand.Position)
                        -- Left leg
                        local LUL = Camera:WorldToViewportPoint(plr.Character.LeftUpperLeg.Position)
                        local LLL = Camera:WorldToViewportPoint(plr.Character.LeftLowerLeg.Position)
                        local LF = Camera:WorldToViewportPoint(plr.Character.LeftFoot.Position)
                        -- Right leg
                        local RUL = Camera:WorldToViewportPoint(plr.Character.RightUpperLeg.Position)
                        local RLL = Camera:WorldToViewportPoint(plr.Character.RightLowerLeg.Position)
                        local RF = Camera:WorldToViewportPoint(plr.Character.RightFoot.Position)

                        --Head
                        limbs.Head_UpperTorso.From = Vector2.new(H.X, H.Y)
                        limbs.Head_UpperTorso.To = Vector2.new(UT.X, UT.Y)

                        --Spine
                        limbs.UpperTorso_LowerTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.UpperTorso_LowerTorso.To = Vector2.new(LT.X, LT.Y)

                        -- Left Arm
                        limbs.UpperTorso_LeftUpperArm.From = Vector2.new(UT.X, UT.Y)
                        limbs.UpperTorso_LeftUpperArm.To = Vector2.new(LUA.X, LUA.Y)

                        limbs.LeftUpperArm_LeftLowerArm.From = Vector2.new(LUA.X, LUA.Y)
                        limbs.LeftUpperArm_LeftLowerArm.To = Vector2.new(LLA.X, LLA.Y)

                        limbs.LeftLowerArm_LeftHand.From = Vector2.new(LLA.X, LLA.Y)
                        limbs.LeftLowerArm_LeftHand.To = Vector2.new(LH.X, LH.Y)

                        -- Right Arm
                        limbs.UpperTorso_RightUpperArm.From = Vector2.new(UT.X, UT.Y)
                        limbs.UpperTorso_RightUpperArm.To = Vector2.new(RUA.X, RUA.Y)

                        limbs.RightUpperArm_RightLowerArm.From = Vector2.new(RUA.X, RUA.Y)
                        limbs.RightUpperArm_RightLowerArm.To = Vector2.new(RLA.X, RLA.Y)

                        limbs.RightLowerArm_RightHand.From = Vector2.new(RLA.X, RLA.Y)
                        limbs.RightLowerArm_RightHand.To = Vector2.new(RH.X, RH.Y)

                        -- Left Leg
                        limbs.LowerTorso_LeftUpperLeg.From = Vector2.new(LT.X, LT.Y)
                        limbs.LowerTorso_LeftUpperLeg.To = Vector2.new(LUL.X, LUL.Y)

                        limbs.LeftUpperLeg_LeftLowerLeg.From = Vector2.new(LUL.X, LUL.Y)
                        limbs.LeftUpperLeg_LeftLowerLeg.To = Vector2.new(LLL.X, LLL.Y)

                        limbs.LeftLowerLeg_LeftFoot.From = Vector2.new(LLL.X, LLL.Y)
                        limbs.LeftLowerLeg_LeftFoot.To = Vector2.new(LF.X, LF.Y)

                        -- Right Leg
                        limbs.LowerTorso_RightUpperLeg.From = Vector2.new(LT.X, LT.Y)
                        limbs.LowerTorso_RightUpperLeg.To = Vector2.new(RUL.X, RUL.Y)

                        limbs.RightUpperLeg_RightLowerLeg.From = Vector2.new(RUL.X, RUL.Y)
                        limbs.RightUpperLeg_RightLowerLeg.To = Vector2.new(RLL.X, RLL.Y)

                        limbs.RightLowerLeg_RightFoot.From = Vector2.new(RLL.X, RLL.Y)
                        limbs.RightLowerLeg_RightFoot.To = Vector2.new(RF.X, RF.Y)
                    end

                    if limbs.Head_UpperTorso.Visible ~= true then
                        Visibility(true)
                    end
                else 
                    if limbs.Head_UpperTorso.Visible ~= false then
                        Visibility(false)
                    end
                end
            else 
                if limbs.Head_UpperTorso.Visible ~= false then
                    Visibility(false)
                end
                if game.Players:FindFirstChild(plr.Name) == nil then 
                    for i, v in pairs(limbs) do
                        v:Remove()
                    end
                    connection:Disconnect()
                end
            end
        end)
    end

    local function UpdaterR6()
        local connection
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 then
                local HUM, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then
                    local H = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                    if limbs.Head_Spine.From ~= Vector2.new(H.X, H.Y) then
                        local T_Height = plr.Character.Torso.Size.Y/2 - 0.2
                        local UT = Camera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, T_Height, 0)).p)
                        local LT = Camera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, -T_Height, 0)).p)

                        local LA_Height = plr.Character["Left Arm"].Size.Y/2 - 0.2
                        local LUA = Camera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, LA_Height, 0)).p)
                        local LLA = Camera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, -LA_Height, 0)).p)

                        local RA_Height = plr.Character["Right Arm"].Size.Y/2 - 0.2
                        local RUA = Camera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, RA_Height, 0)).p)
                        local RLA = Camera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, -RA_Height, 0)).p)

                        local LL_Height = plr.Character["Left Leg"].Size.Y/2 - 0.2
                        local LUL = Camera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, LL_Height, 0)).p)
                        local LLL = Camera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, -LL_Height, 0)).p)

                        local RL_Height = plr.Character["Right Leg"].Size.Y/2 - 0.2
                        local RUL = Camera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, RL_Height, 0)).p)
                        local RLL = Camera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, -RL_Height, 0)).p)

                        -- Head
                        limbs.Head_Spine.From = Vector2.new(H.X, H.Y)
                        limbs.Head_Spine.To = Vector2.new(UT.X, UT.Y)

                        --Spine
                        limbs.Spine.From = Vector2.new(UT.X, UT.Y)
                        limbs.Spine.To = Vector2.new(LT.X, LT.Y)

                        --Left Arm
                        limbs.LeftArm.From = Vector2.new(LUA.X, LUA.Y)
                        limbs.LeftArm.To = Vector2.new(LLA.X, LLA.Y)

                        limbs.LeftArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.LeftArm_UpperTorso.To = Vector2.new(LUA.X, LUA.Y)

                        --Right Arm
                        limbs.RightArm.From = Vector2.new(RUA.X, RUA.Y)
                        limbs.RightArm.To = Vector2.new(RLA.X, RLA.Y)

                        limbs.RightArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.RightArm_UpperTorso.To = Vector2.new(RUA.X, RUA.Y)

                        --Left Leg
                        limbs.LeftLeg.From = Vector2.new(LUL.X, LUL.Y)
                        limbs.LeftLeg.To = Vector2.new(LLL.X, LLL.Y)

                        limbs.LeftLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
                        limbs.LeftLeg_LowerTorso.To = Vector2.new(LUL.X, LUL.Y)

                        --Right Leg
                        limbs.RightLeg.From = Vector2.new(RUL.X, RUL.Y)
                        limbs.RightLeg.To = Vector2.new(RLL.X, RLL.Y)

                        limbs.RightLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
                        limbs.RightLeg_LowerTorso.To = Vector2.new(RUL.X, RUL.Y)
                    end

                    if limbs.Head_Spine.Visible ~= true then
                        Visibility(true)
                    end
                else 
                    if limbs.Head_Spine.Visible ~= false then
                        Visibility(false)
                    end
                end
            else 
                if limbs.Head_Spine.Visible ~= false then
                    Visibility(false)
                end
                if game.Players:FindFirstChild(plr.Name) == nil then 
                    for i, v in pairs(limbs) do
                        v:Remove()
                    end
                    connection:Disconnect()
                end
            end
        end)
    end

    if R15 then
        coroutine.wrap(UpdaterR15)()
    else 
        coroutine.wrap(UpdaterR6)()
    end
end

for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= Player.Name then
        DrawESP(v)
    end
end

game.Players.PlayerAdded:Connect(function(newplr)
    if newplr.Name ~= Player.Name then
        DrawESP(newplr)
    end
end)
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Box-Hp",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
 
-- ESP Configuration
local ESP = {
    Enabled = true,
    ShowTeamColor = true,
    ShowHealthBar = true,
    TextSize = 14,
    BoxThickness = 2,
    BoxTransparency = 0.5,
    TextTransparency = 0,
    HealthBarThickness = 2,
    HealthBarWidth = 50,
    HealthBarHeight = 5,
    MaxDistance = 5000, -- Increased max distance to 5000 studs
}
 
-- Storage for ESP drawings
local ESPObjects = {}
 
-- Function to create ESP objects for a player
local function CreateESPForPlayer(player)
    if player == LocalPlayer then return end
    
    local espObject = {}
    
    -- Box outline for player
    espObject.Box = Drawing.new("Square")
    espObject.Box.Visible = false
    espObject.Box.Thickness = ESP.BoxThickness
    espObject.Box.Transparency = ESP.BoxTransparency
    espObject.Box.Filled = false
    
    -- Player name and health text
    espObject.Text = Drawing.new("Text")
    espObject.Text.Visible = false
    espObject.Text.Size = ESP.TextSize
    espObject.Text.Center = true
    espObject.Text.Outline = true
    espObject.Text.Transparency = ESP.TextTransparency
    
    -- Health bar background (gray)
    espObject.HealthBG = Drawing.new("Square")
    espObject.HealthBG.Visible = false
    espObject.HealthBG.Thickness = ESP.HealthBarThickness
    espObject.HealthBG.Filled = true
    espObject.HealthBG.Color = Color3.fromRGB(100, 100, 100)
    espObject.HealthBG.Transparency = 0.7
    
    -- Health bar fill (green to red depending on health)
    espObject.HealthBar = Drawing.new("Square")
    espObject.HealthBar.Visible = false
    espObject.HealthBar.Thickness = ESP.HealthBarThickness
    espObject.HealthBar.Filled = true
    espObject.HealthBar.Transparency = 0.7
    
    ESPObjects[player] = espObject
    
    -- Clear ESP when player leaves
    player.AncestryChanged:Connect(function()
        if not player:IsDescendantOf(game) then
            if ESPObjects[player] then
                for _, object in pairs(ESPObjects[player]) do
                    object:Remove()
                end
                ESPObjects[player] = nil
            end
        end
    end)
end
 
-- Create ESP for all existing players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESPForPlayer(player)
    end
end
 
-- Create ESP for new players who join
Players.PlayerAdded:Connect(CreateESPForPlayer)
 
-- Clear ESP for players who leave
Players.PlayerRemoving:Connect(function(player)
    if ESPObjects[player] then
        for _, object in pairs(ESPObjects[player]) do
            object:Remove()
        end
        ESPObjects[player] = nil
    end
end)
 
-- Function to get player team color
local function GetPlayerTeamColor(player)
    if player.Team then
        return player.TeamColor.Color
    end
    return Color3.fromRGB(255, 255, 255) -- White for no team
end
 
-- Function to get health color based on percentage
local function GetHealthColor(health, maxHealth)
    local healthPercent = health / maxHealth
    
    -- Gradient from red to green based on health percentage
    local r = math.clamp(2 * (1 - healthPercent), 0, 1)
    local g = math.clamp(2 * healthPercent, 0, 1)
    
    return Color3.new(r, g, 0)
end
 
-- Update ESP on each frame
RunService.RenderStepped:Connect(function()
    if not ESP.Enabled then
        -- Hide all ESP elements if disabled
        for _, espObject in pairs(ESPObjects) do
            for _, drawing in pairs(espObject) do
                drawing.Visible = false
            end
        end
        return
    end
    
    for player, espObject in pairs(ESPObjects) do
        -- Get character and make sure it's valid
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("Humanoid") then
            for _, drawing in pairs(espObject) do
                drawing.Visible = false
            end
            continue
        end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")
        
        -- Get health information
        local health = humanoid.Health
        local maxHealth = humanoid.MaxHealth
        
        -- Check if character is on screen and within max distance
        local vector, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
        local distance = (humanoidRootPart.Position - Camera.CFrame.Position).Magnitude
        
        -- Only show ESP if player is on screen and within max distance
        if onScreen and distance <= ESP.MaxDistance then
            -- Get player size for box ESP (using character bounds)
            local topPosition = humanoidRootPart.Position + Vector3.new(0, 3, 0)
            local bottomPosition = humanoidRootPart.Position - Vector3.new(0, 3, 0)
            
            local topVector = Camera:WorldToViewportPoint(topPosition)
            local bottomVector = Camera:WorldToViewportPoint(bottomPosition)
            
            local height = math.abs(topVector.Y - bottomVector.Y)
            local width = height * 0.6
            
            local boxPosition = Vector2.new(vector.X - width / 2, vector.Y - height / 2)
            local boxSize = Vector2.new(width, height)
            
            -- Update box
            espObject.Box.Position = boxPosition
            espObject.Box.Size = boxSize
            espObject.Box.Color = GetPlayerTeamColor(player)
            espObject.Box.Visible = true
            
            -- Update player name and health text
            espObject.Text.Position = Vector2.new(vector.X, boxPosition.Y - 20)
            espObject.Text.Text = string.format("%s [%.0f%%]", player.Name, (health / maxHealth) * 100)
            espObject.Text.Color = GetPlayerTeamColor(player)
            espObject.Text.Visible = true
            
            -- Update health bar background
            espObject.HealthBG.Position = Vector2.new(vector.X - ESP.HealthBarWidth / 2, boxPosition.Y - 10)
            espObject.HealthBG.Size = Vector2.new(ESP.HealthBarWidth, ESP.HealthBarHeight)
            espObject.HealthBG.Visible = ESP.ShowHealthBar
            
            -- Update health bar fill
            local healthPercent = health / maxHealth
            espObject.HealthBar.Position = Vector2.new(vector.X - ESP.HealthBarWidth / 2, boxPosition.Y - 10)
            espObject.HealthBar.Size = Vector2.new(ESP.HealthBarWidth * healthPercent, ESP.HealthBarHeight)
            espObject.HealthBar.Color = GetHealthColor(health, maxHealth)
            espObject.HealthBar.Visible = ESP.ShowHealthBar
        else
            -- Hide ESP elements if player is off screen or too far
            for _, drawing in pairs(espObject) do
                drawing.Visible = false
            end
        end
    end
end)
 
-- Add toggle functionality (can be bound to a key)
local UserInputService = game:GetService("UserInputService")
 
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightAlt then
        ESP.Enabled = not ESP.Enabled
    end
end) 
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "AimBot",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local FOV_RADIUS = 100
local LOCK_STRENGTH = 1
local FOV_COLOR = Color3.fromRGB(255, 0, 0)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local FOV = Drawing.new("Circle")
FOV.Radius = FOV_RADIUS
FOV.Thickness = 2
FOV.Transparency = 1
FOV.Filled = false
FOV.Color = FOV_COLOR
FOV.NumSides = 100
FOV.Visible = true

local aiming = false
local lastCFrame = Camera.CFrame

local function findAimPart(char)
    local parts = {"Head", "HumanoidRootPart", "UpperTorso"}
    for _, partName in ipairs(parts) do
        local part = char:FindFirstChild(partName)
        if part then return part end
    end
    return nil
end

local function getClosestTarget()
    local mouse = UserInputService:GetMouseLocation()
    local closest = nil
    local shortestDistance = FOV_RADIUS

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local aimPart = findAimPart(player.Character)
            if aimPart then
                local pos, onScreen = Camera:WorldToViewportPoint(aimPart.Position)
                local dist = (Vector2.new(pos.X, pos.Y) - mouse).Magnitude
                if onScreen and dist < shortestDistance then
                    shortestDistance = dist
                    closest = aimPart
                end
            end
        end
    end

    return closest
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if input.KeyCode == Enum.KeyCode.X and not gpe then
        aiming = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gpe)
    if input.KeyCode == Enum.KeyCode.X then
        aiming = false
    end
end)

RunService.RenderStepped:Connect(function()
    local mouse = UserInputService:GetMouseLocation()
    FOV.Position = Vector2.new(mouse.X, mouse.Y)
    local currentCFrame = Camera.CFrame

    if aiming then
        local targetPart = getClosestTarget()
        if targetPart then
            local screenPos = Camera:WorldToViewportPoint(targetPart.Position)
            local dx = screenPos.X - mouse.X
            local dy = screenPos.Y - mouse.Y

            mousemoverel(dx * LOCK_STRENGTH, dy * LOCK_STRENGTH)

            local recoilOffset = currentCFrame.Position - lastCFrame.Position
            Camera.CFrame = Camera.CFrame - recoilOffset
        end
    end

    lastCFrame = currentCFrame
end)

   end,
})
