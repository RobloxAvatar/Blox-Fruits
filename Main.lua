_G.AutoFarm = false
_G.Weapon = ""
_G.Enemy = ""

local enemys = {}
local weapons = {}
local teleports = {"Pirate Starter", "Marine 1st", "Marine 2sd", "Middle Town", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Colosseum", "Prison", "Mob Leader", "Magma Village", "UnderWater Gate", "UnderWater City", "Fountain City", "sky 1st", "sky 2sd"}

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/RobloxAvatar/uiLibary/main/Uilib.lua')))()

local w = library:CreateWindow("Blox Fruits")
local MainTab = w:CreateFolder("Main")
local TeleportTab = w:CreateFolder("Teleports")

function topos(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos + Vector3.new(0,5,0)}) end)
    tween:Play()
    if Distance <= 250 then
        tween:Cancel()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
    end
end

function collectfruit()
    for i,v in pairs(workspace:GetChildren()) do
        if string.find(v.Name, "Fruit") then
            topos(v.Handle.CFrame)
        end
    end
end

local function round(n)
	return math.floor(tonumber(n) + 0.5)
end

_G.Esp = false

function fruitesp()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        pcall(function()
            if _G.Esp then
                if string.find(v.Name, "Fruit") then   
                    if not v.Handle:FindFirstChild('FruitEsp') then
                        local bill = Instance.new('BillboardGui', v.Handle)
                        bill.Name = 'FruitEsp'
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1,200,1,30)
                        bill.Adornee = v.Handle
                        bill.AlwaysOnTop = true
                        local name = Instance.new('TextLabel',bill)
                        name.Font = "GothamBold"
                        name.FontSize = "Size14"
                        name.TextWrapped = true
                        name.Size = UDim2.new(1,0,1,0)
                        name.TextYAlignment = 'Top'
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 0, 0)
                        name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    else
                        v.Handle['FruitEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Handle.Position).Magnitude/3) ..' M')
                    end
                end
            end
        end)
    end
end

for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    table.insert(enemys, v.Name)
end

local enemydropdown = MainTab:Dropdown("Enemys", enemys, true, function(enemy)
    _G.Enemy = enemy
end)

game:GetService("Workspace").Enemies.ChildAdded:Connect(function(inst)
	table.insert(enemys, inst.Name)
    enemydropdown:Refresh(enemys)
end)

game:GetService("Workspace").Enemies.ChildRemoved:Connect(function(inst)
	tablenumber = table.find(enemys, inst.Name)
    table.remove(enemys, tablenumber)
    enemydropdown:Refresh(enemys)
end)

for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Tool") then
		table.insert(weapons, v.Name)
	end
end

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
	table.insert(weapons, v.Name)
end

local weapondropdown = MainTab:Dropdown("Weapons", weapons, true, function(weapon)
    _G.Weapon = weapon
end)

game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(inst)
    for i,v in pairs(weapons) do
        if not v:FindFirstChild(inst.Name) then
            table.insert(weapons, inst.Name)
            weapondropdown:Refresh(weapons)
        end
    end
end)

MainTab:Toggle("Auto Farm", function(bool)
    _G.AutoFarm = bool
end)

MainTab:Toggle("Esp", function(bool)
    _G.Esp = bool
end)

MainTab:Button("Collect Fruit", function()
    collectfruit()
end)

local teleportdropdown = TeleportTab:Dropdown("Teleports", teleports, true, function(location)
    if location == "Pirate Starter" then
        topos(CFrame.new(1042.15015, 16.2993546, 1444.34424, 1, 6.46784812e-08, -6.86348358e-14, -6.46784812e-08, 1, -3.83237797e-08, 6.61561124e-14, 3.83237797e-08, 1))
    else
        if location == "Marine 1st" then
            topos(CFrame.new(-2599.66553, 6.91462135, 2062.22168, 1, -5.70524108e-08, 2.55859922e-13, 5.70524108e-08, 1, -9.49867882e-08, -2.504407e-13, 9.49867882e-08, 1))
        else
            if location == "Marine 2sd" then
                topos(CFrame.new(-5081.34521, 85.2216415, 4257.35889, 1, 5.21231378e-08, 7.20589224e-15, -5.21231378e-08, 1, 2.02111874e-08, -6.15242127e-15, -2.02111874e-08, 1))
            else
                if location == "Middle Town" then
                    topos(CFrame.new(-655.970886, 7.87802601, 1573.76123, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                else
                    if location == "Jungle" then
                        topos(CFrame.new(-1499.98779, 22.8779125, 353.870605, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                    else
                        if location == "Pirate Village" then
                            topos(CFrame.new(-1163.38892, 44.777832, 3842.82764, 0.999999285, -6.39544808e-08, -0.00121750275, 6.39655582e-08, 1, 9.05532538e-09, 0.00121750275, -9.13319642e-09, 0.999999285))
                        else
                            if location == "Desert" then
                                topos(CFrame.new(954.020569, 6.6275506, 4262.61133, 1, -8.77268747e-08, -8.27179658e-10, 8.77268747e-08, 1, 6.0460053e-08, 8.27174385e-10, -6.0460053e-08, 1))
                            else
                                if location == "Frozen Village" then
                                    topos(CFrame.new(1144.5271, 7.32920837, -1164.7323, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                else
                                    if location == "Colosseum" then
                                        topos(CFrame.new(-1667.58691, 39.3856316, -3135.58179, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                    else
                                        if location == "Prison" then
                                            topos(CFrame.new(4857.69824, 5.67803049, 732.757507, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                        else
                                            if location == "Mob Leader" then
                                                topos(CFrame.new(-2841.96045, 7.35604858, 5318.104, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                            else
                                                if location == "Magma Village" then
                                                    topos(CFrame.new(-5328.87402, 8.61647987, 8427.39941, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                                else
                                                    if location == "UnderWater Gate" then
                                                        topos(CFrame.new(3893.95312, 5.39895248, -1893.48511, 1, 1.51358337e-09, -3.83145698e-15, -1.51358337e-09, 1, -2.50499763e-08, 3.79354166e-15, 2.50499763e-08, 1))
                                                    else
                                                        if location == "UnderWater City" then
                                                            topos(CFrame.new(61163.8516, 11.6796875, 1819.78418, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                                        else
                                                            if location == "Fountain City" then
                                                                topos(CFrame.new(5244.71289, 38.5269318, 4073.49585, 0.999942064, -9.15267062e-09, 0.0107635809, 9.82317161e-09, 1, -6.22406446e-08, -0.0107635809, 6.23427709e-08, 0.999942064))
                                                            else
                                                                if location == "sky 1st" then
                                                                    topos(CFrame.new(-4607.82275, 872.54248, -1667.55688, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                                                else
                                                                    if location == "sky 2sd" then
                                                                        topos(CFrame.new(-7894.61768, 5547.1416, -380.291199, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                                                                    end
                                                                end
                                                            end 
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.Esp then
            pcall(function()
                fruitesp()
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                for i,v in next, game:GetService("Workspace").Enemies:GetChildren() do
                    if _G.Weapon ~= nil and v.Name == _G.Enemy then
                        for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        v2.HumanoidRootPart.CanCollide = false
                        v2.HumanoidRootPart.Size = Vector3.new(200, 200, 200)
                        v2.HumanoidRootPart.Color = Color3.new(193, 193, 193)
                        v2.HumanoidRootPart.Transparency = 1
                        v2.Head.Anchored = true
                    end
                    Distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
                    pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = v.HumanoidRootPart.CFrame + Vector3.new(20,10,10)}) end)
                    tween:Play()
                    if Distance <= 250 then
                        tween:Cancel()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(20,10,10)
                    end
                    repeat 
                    wait(0.1)
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == _G.Weapon then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                            end
                        end
                        game:GetService("VirtualUser"):ClickButton1(Vector2.new()) 
                        until v.Humanoid.Health == 0 or _G.AutoFarm == false
                    end
                end   
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoFarm == false then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    v.HumanoidRootPart.CanCollide = false
				    v.HumanoidRootPart.Size = Vector3.new(2.36664, 2.36664, 1.18332)
                    v.Head.Anchored = false
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.Esp == false then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        if v.Handle:FindFirstChild('FruitEsp') then
                            v.Handle:FindFirstChild('FruitEsp'):Destroy()
                        end
                    end
                end
            end)
        end
    end
end)
        
game:GetService("Workspace").Enemies.ChildAdded:Connect(function(inst)
	if _G.AutoFarm then
		inst:WaitForChild("HumanoidRootPart").CanCollide = false
		inst:WaitForChild("HumanoidRootPart").Size = Vector3.new(200, 200, 200)
		inst:WaitForChild("HumanoidRootPart").Color = Color3.new(193, 193, 193)
		inst:WaitForChild("HumanoidRootPart").Transparency = 1
	end
end)
