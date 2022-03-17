local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
    SchemeColor = Color3.fromRGB(0,255,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

if game.PlaceId== 155615604 then
	
	local Window = Library.CreateLib("RBLX Breaker Hub - Prison Life", "Sentinel")
	local LocalPlayer = game.Players.LocalPlayer
	
	--: Tabs
	local Main = Window:NewTab("Home")
	local PlayerTab = Window:NewTab("Player")
	local TeleportTab = Window:NewTab("Teleports")
	local SettingsTab = Window:NewTab("Settings")
	
	--: Sections
	local Sliders = PlayerTab:NewSection("Player Info")
	local Misc = Main:NewSection("Misc")
	local TeleportSection = TeleportTab:NewSection("Teleports")
	local ColorSettings = SettingsTab:NewSection("Colors")
	
	Misc:NewDropdown("Give Item", "Gives you a gun", {"M9", "Remington 870", "AK-47", "Hammer"}, function(v)
		if v == 'Hammer' or v == 'Key Card' then
			local A_1 = game:GetService("Workspace")["Prison_ITEMS"].single[v].ITEMPICKUP
			local Event = game:GetService("Workspace").Remote.ItemHandler
			Event:InvokeServer(A_1)
		else
			local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
			local Event = game:GetService("Workspace").Remote.ItemHandler
			Event:InvokeServer(A_1)
		end
	end)
	
	Misc:NewButton("Mod Current Weapon (Hold out weapon)", "Mods the weapon you are holding.", function()   
        for i, v in pairs(LocalPlayer.Character:GetChildren()) do
        	if v:IsA('Tool') and v:FindFirstChild('GunStates') then
        		local GunModule = require(v:FindFirstChild('GunStates'))
        		GunModule.CurrentAmmo = math.huge
        		GunModule.MaxAmmo = math.huge
        		GunModule.StoredAmmo = math.huge
        		GunModule.FireRate = 0.00001
        		GunModule.AutoFire = true
        		GunModule.ReloadTime = 0.00001
        	end
        end
	end)
	
	Sliders:NewSlider("Walk Speed", "Changes Player walkspeed.", 200, 16, function(Value) -- 500 (MaxValue) | 0 (MinValue)
	    LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end)
	
	Sliders:NewSlider("Jump Power", "Changes Player JumpPower.", 200, 50, function(Value) -- 500 (MaxValue) | 0 (MinValue)
	    LocalPlayer.Character.Humanoid.JumpPower = Value
	end)
	
	--: Telports
	TeleportSection:NewButton("Courtyard", "Teleports player to courtyard.", function()
	    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(815.008057, 97.9999237, 2433.22729, -0.995663524, -2.170784e-09, -0.0930277258, -2.03225303e-09, 1, -1.58387081e-09, 0.0930277258, -1.38794654e-09, -0.995663524)
	end)
	
	TeleportSection:NewButton("Outside Prison", "Teleports player to the outside gate.", function()
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(483.468079, 98.039917, 2216.09766, 0.561762035, 1.73434564e-08, -0.82729888, -2.62025548e-08, 1, 3.17159321e-09, 0.82729888, 1.98956638e-08, 0.561762035)
	end)
	
	TeleportSection:NewButton("Criminal Spawn", "Teleports player to the criminal warehouse.", function()
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-888.93927, 94.1270294, 2155.52979, -0.345869452, -1.7751379e-08, -0.938282669, 1.22125843e-09, 1, -1.93691907e-08, 0.938282669, -7.84509702e-09, -0.345869452)
	end)
	
	TeleportSection:NewButton("Armory", "Teleports player to the police armory.", function()
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(858.124084, 102.799988, 2279.81177, 0.824930549, 4.22697433e-08, 0.565234065, -5.5802353e-08, 1, 6.65799016e-09, -0.565234065, -3.70337716e-08, 0.824930549)
	end)
	--: Theme Picker.
	
	for theme, color in pairs(colors) do
	    ColorSettings:NewColorPicker(theme, "Change your "..theme, color, function(color3)
	        Library:ChangeColor(theme, color3)
	    end)
	end

end
