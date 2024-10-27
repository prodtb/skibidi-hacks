-- Since this custom function doesn't exist im making it myself (L bad executor)
local isnetworkowner = isnetworkowner
if not isnetworkowner then
	isnetworkowner = function(Part)
		return Part.ReceiveAge == 0
	end
end
--/> Services
local RunService = game:GetService('RunService')
local Players = game:GetService('Players')
local RepStorage = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")

--/> Varaibles
local Flinging
local SETweenSpeed = 50 -- studs per second
local wasStreamingEnabled = workspace.StreamingEnabled -- if you run gui again this check wont work
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character
local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
local mouse = localPlayer:GetMouse()
local flingPart
local whileloop
local NetlessVel = Vector3.new(15, -15, -15)
local OGNetlessVel = NetlessVel
local FlightFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Coolmandfgfgdvcgfg/trep/main/flyfunc"))()
local Using = false
local clicktoselect = false
local ctsDebounce = false
local FastCheckToggle = true
local RunningCheck = false
local offset = 3000 -- changes according to wasStreamingEnabled value
local G = ((getgenv and getgenv()) or _G)
G.fpdh = workspace.FallenPartsDestroyHeight
local fpdh = G.fpdh or workspace.FallenPartsDestroyHeight
_G.FlingPartIdlePosition = _G.FlingPartIdlePosition or CFrame.new(0, fpdh + 100, 0)
workspace.FallenPartsDestroyHeight = 0/0
local IdlePos = _G.FlingPartIdlePosition
local IdleTeleporting = true

--/> Instances

local ctsHighlight = Instance.new("Highlight")
local UHG = Instance.new("ScreenGui")
local MFrame = Instance.new("Frame")
local Credits = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local AutoRet = Instance.new("TextButton")
local VULStatus = Instance.new("TextLabel")
local Username1 = Instance.new("TextBox")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Template = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local UIGridLayout = Instance.new("UIGridLayout")
local VulCheck = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local Disclaimer = Instance.new("TextLabel")
local Username2 = Instance.new("TextBox")
local Instruct = Instance.new("TextLabel")
local Selection = Instance.new("TextButton")
local FastCheck = Instance.new("TextButton")
local TextLabel_3 = Instance.new("TextLabel")

if getgenv().net then
	getgenv().net:Disconnect()
	getgenv().net = nil
end

getgenv().net = RunService.RenderStepped:Connect(function()
	localPlayer.MaximumSimulationRadius = 9e9
	localPlayer.SimulationRadius = 9e9
end)

--/> Properties

-- hat methods
AccessoryTable = { ["AccessoryData"] = { ["AccessoryType"] = Enum.AccessoryType.Hat, ["AssetId"] = 4640898, ["Order"] = 1 } }    args = { [1] = { ["Properties"] = { [1] = { ["PropertyName"] = "ClimbAnimation", ["Value"] = 0 }, [2] = { ["PropertyName"] = "FallAnimation", ["Value"] = 0 }, [3] = { ["PropertyName"] = "IdleAnimation", ["Value"] = 0 }, [4] = { ["PropertyName"] = "JumpAnimation", ["Value"] = 0 }, [5] = { ["PropertyName"] = "RunAnimation", ["Value"] = 0 }, [6] = { ["PropertyName"] = "SwimAnimation", ["Value"] = 0 }, [7] = { ["PropertyName"] = "WalkAnimation", ["Value"] = 0 }, [8] = { ["PropertyName"] = "GraphicTShirt", ["Value"] = 0 }, [9] = { ["PropertyName"] = "Shirt", ["Value"] = 0 }, [10] = { ["PropertyName"] = "Pants", ["Value"] = 0 }, [11] = { ["PropertyName"] = "BodyTypeScale", ["Value"] = 0 }, [12] = { ["PropertyName"] = "HeadScale", ["Value"] = 1 }, [13] = { ["PropertyName"] = "HeightScale", ["Value"] = 1 }, [14] = { ["PropertyName"] = "ProportionScale", ["Value"] = 0 }, [15] = { ["PropertyName"] = "WidthScale", ["Value"] = 1 }, [16] = { ["PropertyName"] = "HeadColor", ["Value"] = Color3.new(0,0,0) }, [17] = { ["PropertyName"] = "LeftArmColor", ["Value"] = Color3.new(0,0,0) }, [18] = { ["PropertyName"] = "LeftLegColor", ["Value"] = Color3.new(0,0,0) }, [19] = { ["PropertyName"] = "RightArmColor", ["Value"] = Color3.new(0,0,0) }, [20] = { ["PropertyName"] = "RightLegColor", ["Value"] = Color3.new(0,0,0) }, [21] = { ["PropertyName"] = "TorsoColor", ["Value"] = Color3.new(0,0,0) } }, ["AcessoryData"] = { [1] = { ["AssetId"] = 4640898, ["AccessoryType"] = Enum.AccessoryType.Hat }, }, ["BodyPartData"] = { [1] = { ["BodyPartType"] = "LeftLeg", ["AssetId"] = 0 }, [2] = { ["BodyPartType"] = "RightLeg", ["AssetId"] = 0 }, [3] = { ["BodyPartType"] = "LeftArm", ["AssetId"] = 0 }, [4] = { ["BodyPartType"] = "RightArm", ["AssetId"] = 0 }, [5] = { ["BodyPartType"] = "Torso", ["AssetId"] = 0 }, [6] = { ["BodyPartType"] = "Head", ["AssetId"] = 0 }, [7] = { ["BodyPartType"] = "Face", ["AssetId"] = 0 } } } } args2 = { [1] = 4640898, [2] = true } args4 = { [1] = "Equip", [2] = { ["CreatorHasVerifiedBadge"] = true, ["CreatorTargetId"] = 1, ["IsOffSale"] = true, ["PriceStatus"] = "Off Sale", ["AssetType"] = "Hat", ["ProductId"] = 760004, ["ItemRestrictions"] = {}, ["ItemStatus"] = {}, ["SaleLocationType"] = "NotApplicable", ["FavoriteCount"] = 9601, ["ItemType"] = "Asset", ["Id"] = 4640898, ["PurchaseCount"] = 0, ["Name"] = "Doombringer's Doombringer", ["Description"] = "It's MrDoomBringer! We must flee!", ["CreatorName"] = "Roblox", ["CreatorType"] = "User" } } args5 = { [1] = "accessory", [2] = 4640898 } args6 = { [1] = { ["Id"] = "4640898", ["Name"] = "Doombringer's Doombringer", ["AssetType"] = 8 }, [2] = true } args7 = { [1] = "add", [2] = 4640898 } args8 = { [1] = "remove", [2] = 4640898 } args9 = { [1] = { ["RigType"] = "R15", ["Accessories"] = { [1] = { ["IsLayered"] = false, ["AccessoryType"] = Enum.AccessoryType.Hat, ["AssetId"] = 4640898 }, }, ["Emotes"] = { ["Hello"] = { [1] = 0 }, ["Stadium"] = { [1] = 0 }, ["Shrug"] = { [1] = 0 }, ["Point2"] = { [1] = 0 } }, ["Properties"] = { [1] = { ["PropertyName"] = "GraphicTShirt", ["AssetId"] = 0 }, [2] = { ["PropertyName"] = "Pants", ["AssetId"] = 0 }, [3] = { ["PropertyName"] = "Shirt", ["AssetId"] = 0 }, [4] = { ["PropertyName"] = "Face", ["AssetId"] = 0 }, [5] = { ["PropertyName"] = "Torso", ["AssetId"] = 0 }, [6] = { ["PropertyName"] = "Head", ["AssetId"] = 0 }, [7] = { ["PropertyName"] = "LeftArm", ["AssetId"] = 0 }, [8] = { ["PropertyName"] = "LeftLeg", ["AssetId"] = 0 }, [9] = { ["PropertyName"] = "RightArm", ["AssetId"] = 0 }, [10] = { ["PropertyName"] = "RightLeg", ["AssetId"] = 0 }, [11] = { ["PropertyName"] = "WalkAnimation", ["AssetId"] = 0 }, [12] = { ["PropertyName"] = "RunAnimation", ["AssetId"] = 0 }, [13] = { ["PropertyName"] = "IdleAnimation", ["AssetId"] = 0 }, [14] = { ["PropertyName"] = "JumpAnimation", ["AssetId"] = 0 }, [15] = { ["PropertyName"] = "FallAnimation", ["AssetId"] = 0 }, [16] = { ["PropertyName"] = "ClimbAnimation", ["AssetId"] = 0 }, [17] = { ["PropertyName"] = "SwimAnimation", ["AssetId"] = 0 }, [18] = { ["PropertyName"] = "MoodAnimation", ["AssetId"] = 0 }, [19] = { ["PropertyName"] = "HeadColor", ["AssetId"] = Color3.new(0,0,0) }, [20] = { ["PropertyName"] = "LeftArmColor", ["AssetId"] = Color3.new(0,0,0) }, [21] = { ["PropertyName"] = "LeftLegColor", ["AssetId"] =Color3.new(0,0,0) }, [22] = { ["PropertyName"] = "RightArmColor", ["AssetId"] = Color3.new(0,0,0) }, [23] = { ["PropertyName"] = "RightLegColor", ["AssetId"] = Color3.new(0,0,0) }, [24] = { ["PropertyName"] = "TorsoColor", ["AssetId"] = Color3.new(0,0,0) }, [25] = { ["PropertyName"] = "BodyTypeScale", ["AssetId"] = 0 }, [26] = { ["PropertyName"] = "DepthScale", ["AssetId"] = 1 }, [27] = { ["PropertyName"] = "HeadScale", ["AssetId"] = 1 }, [28] = { ["PropertyName"] = "HeightScale", ["AssetId"] = 1 }, [29] = { ["PropertyName"] = "ProportionScale", ["AssetId"] = 0 }, [30] = { ["PropertyName"] = "WidthScale", ["AssetId"] = 1 } }, ["EquippedEmotes"] = { [1] = { ["Name"] = "Shrug", ["Slot"] = 4 }, [2] = { ["Name"] = "Point2", ["Slot"] = 3 }, [3] = { ["Name"] = "Stadium", ["Slot"] = 2 }, [4] = { ["Name"] = "Hello", ["Slot"] = 1 } } } } args10 = { [1] = "add-owned-assets", [2] = { [1] = 4640898, } } args11 = { [1] = { ["Id"] = 4640898, ["Action"] = "TryItem", ["PropertyName"] = "HatAccessory" } } args12 = { [1] = "wear", [2] = 4640898 } args13 = { [1] = "4640898", [2] = "HatAccessory" } args14 = { [1] = { ["outfit"] = { ["limbColors"] = { ["RightArm"] = Color3.new(0.9490196108818054, 0.9529411792755127, 0.9529411792755127), ["Head"] = Color3.new(0.9490196108818054, 0.9529411792755127, 0.9529411792755127), ["RightLeg"] = Color3.new(0.4313725531101227, 0.6000000238418579, 0.7921568751335144), ["Torso"] = Color3.new(0.05098039284348488, 0.4117647111415863, 0.6745098233222961), ["LeftArm"] = Color3.new(0.9490196108818054, 0.9529411792755127, 0.9529411792755127), ["LeftLeg"] = Color3.new(0.4313725531101227, 0.6000000238418579, 0.7921568751335144) }, ["animations"] = {}, ["accessories"] = { [1] = { ["Id"] = 4640898, ["Type"] = 2 }, [2] = { ["Id"] = 1772336109, ["Type"] = 2 }, [3] = { ["Id"] = 4047884939, ["Type"] = 3 }, [4] = { ["Id"] = 382537569, ["Type"] = 4 }, [5] = { ["Id"] = 4637151279, ["Type"] = 8 }, [6] = { ["Id"] = 4637120775, ["Type"] = 9 }, [7] = { ["Id"] = 4637122096, ["Type"] = 12 }, [8] = { ["Id"] = 4637119437, ["Type"] = 10 }, [9] = { ["Id"] = 4637120072, ["Type"] = 11 }, [10] = { ["Id"] = 144075659, ["Type"] = 6 } }, ["avatarProportions"] = { ["BodyTypeScale"] = 0, ["DepthScale"] = 1, ["HeadScale"] = 1, ["HeightScale"] = 1, ["ProportionScale"] = 0, ["WidthScale"] = 1 } } } } g={[1]="LoadAvatarAsset",[2]=4640898,[3]="HatAccessory"} ConnectionEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ConnectionEvent") function colorToTable(clr) return {tostring(clr.R*255),tostring(clr.G*255),tostring(clr.B*255)} end function ExtractData(humdes) ava = {} for _,v in pairs({"WidthScale", "HeadScale","HeightScale","DepthScale","BodyTypeScale","ProportionScale"}) do  ava[v] = humdes[v] end for _,v in pairs({"Face","Head","LeftArm","RightArm","LeftLeg","RightLeg","Torso"}) do  ava[v] = humdes[v] end for _,v in pairs({"HeadColor","LeftArmColor","RightArmColor","LeftLegColor","RightLegColor","TorsoColor"}) do  ava[v] = colorToTable(humdes[v]) end for _,v in pairs({"GraphicTShirt","Shirt","Pants"}) do  ava[v] = humdes[v] end for _,v in pairs({"ClimbAnimation","FallAnimation","IdleAnimation","JumpAnimation","RunAnimation","SwimAnimation","WalkAnimation"}) do  ava[v] = humdes[v] end; for _,v in pairs({"Hat","Hair","Back","Face","Front","Neck","Shoulders","Waist"}) do  ava[v .. "Accessory"] = humdes[v .. "Accessory"] end; ava.Emotes = humdes:GetEmotes() layered = humdes:GetAccessories(false) for i,v in pairs(layered) do if v.AccessoryType and typeof(v.AccessoryType) == "EnumItem" then v.AccessoryType = v.AccessoryType.Name end end ava.AccessoryBlob = layered return ava end data = ExtractData(game.Players:GetHumanoidDescriptionFromUserId(tonumber(8490)))

do

	if wasStreamingEnabled then
		offset = 500
	end

	if game.CoreGui:FindFirstChild("UHG") then
		game.CoreGui:FindFirstChild("UHG"):Destroy()
	end

	UHG.Name = "UHG"
	UHG.Parent = game.CoreGui
	UHG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MFrame.Name = "MFrame"
	MFrame.Parent = UHG
	MFrame.Active = true
	MFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MFrame.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
	MFrame.BackgroundTransparency = 0.300
	MFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MFrame.BorderSizePixel = 0
	MFrame.Draggable = true
	MFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MFrame.Size = UDim2.new(0.189999998, 0, 0, 0)

	Credits.Name = "Credits"
	Credits.Parent = MFrame
	Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Credits.BackgroundTransparency = 1.000
	Credits.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Credits.BorderSizePixel = 0
	Credits.Position = UDim2.new(0.317844272, 0, 0.969314873, 0)
	Credits.Size = UDim2.new(0.640000045, 0, 0.0306850541, 0)
	Credits.Text = "Made by SammyC, Spong, plusgiant6, Digitality and LoadLua"
	Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
	Credits.TextScaled = true
	Credits.TextSize = 14.000
	Credits.TextWrapped = true

	Title.Name = "Title"
	Title.Parent = MFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.108196639, 0, 0.00252930797, 0)
	Title.Size = UDim2.new(0.780327857, 0, 0.0778670684, 0)
	Title.ZIndex = 3
	Title.Text = "skibidi hacks"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true

	AutoRet.Name = "AutoRet"
	AutoRet.Parent = MFrame
	AutoRet.BackgroundColor3 = Color3.fromRGB(131, 255, 135)
	AutoRet.BackgroundTransparency = 0.500
	AutoRet.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AutoRet.BorderSizePixel = 0
	AutoRet.Position = UDim2.new(0.267837405, 0, 0.929577589, 0)
	AutoRet.Size = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
	AutoRet.ZIndex = 2
	AutoRet.Text = ""
	AutoRet.TextColor3 = Color3.fromRGB(255, 255, 255)
	AutoRet.TextSize = 14.000

	VULStatus.Name = "VULStatus"
	VULStatus.Parent = MFrame
	VULStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	VULStatus.BackgroundTransparency = 1.000
	VULStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
	VULStatus.BorderSizePixel = 0
	VULStatus.Position = UDim2.new(0.317837477, 0, 0.929577589, 0)
	VULStatus.Size = UDim2.new(0.640205264, 0, 0.0434621572, 0)
	VULStatus.Text = "CURRENT STATUS: INACTIVE"
	VULStatus.TextColor3 = Color3.fromRGB(255, 71, 71)
	VULStatus.TextScaled = true
	VULStatus.TextSize = 14.000
	VULStatus.TextWrapped = true

	Username1.Name = "Username1"
	Username1.Parent = MFrame
	Username1.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	Username1.BackgroundTransparency = 0.500
	Username1.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Username1.BorderSizePixel = 0
	Username1.Position = UDim2.new(0.0410088859, 0, 0.119402982, 0)
	Username1.Size = UDim2.new(0.458999991, 0, 0.0726368204, 0)
	Username1.PlaceholderColor3 = Color3.fromRGB(188, 188, 188)
	Username1.PlaceholderText = "Target 1"
	Username1.Text = ""
	Username1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Username1.TextSize = 14.000
	Username1.TextWrapped = true

	ScrollingFrame.Parent = MFrame
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.0378543325, 0, 0.230830401, 0)
	ScrollingFrame.Size = UDim2.new(0.920188069, 0, 0.609185159, 0)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 1

	Template.Name = "Template"
	Template.Parent = ScrollingFrame
	Template.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	Template.BackgroundTransparency = 0.500
	Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Template.BorderSizePixel = 0
	Template.Position = UDim2.new(0.0189274456, 0, 0.929577589, 0)
	Template.Size = UDim2.new(0.25, 0, 0.0500000007, 0)
	Template.Visible = false
	Template.Text = ""
	Template.TextColor3 = Color3.fromRGB(255, 255, 255)
	Template.TextSize = 14.000

	TextLabel.Parent = Template
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(-0.012659804, 0, 0.157961324, 0)
	TextLabel.Size = UDim2.new(1, 0, 0.665424049, 0)
	TextLabel.Text = ""
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextWrapped = true

	UIGridLayout.Parent = ScrollingFrame
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0.00999999978, 0, 0.00999999978, 0)
	UIGridLayout.CellSize = UDim2.new(0.495000005, 0, 0.150000006, 0)

	VulCheck.Name = "VulCheck"
	VulCheck.Parent = MFrame
	VulCheck.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	VulCheck.BackgroundTransparency = 0.500
	VulCheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
	VulCheck.BorderSizePixel = 0
	VulCheck.Position = UDim2.new(0.0189274456, 0, 0.929577589, 0)
	VulCheck.Size = UDim2.new(0.25, 0, 0.0500000007, 0)
	VulCheck.Text = ""
	VulCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
	VulCheck.TextSize = 14.000

	TextLabel_2.Parent = VulCheck
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(-0.012659804, 0, 0.157961324, 0)
	TextLabel_2.Size = UDim2.new(1, 0, 0.665424049, 0)
	TextLabel_2.Text = "Check"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextScaled = true
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextWrapped = true

	Disclaimer.Name = "Disclaimer"
	Disclaimer.Parent = MFrame
	Disclaimer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Disclaimer.BackgroundTransparency = 1.000
	Disclaimer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Disclaimer.BorderSizePixel = 0
	Disclaimer.Position = UDim2.new(0, 0, 0.0802512765, 0)
	Disclaimer.Size = UDim2.new(1, 0, 0.0418604352, 0)
	Disclaimer.ZIndex = 2
	Disclaimer.Text = "This GUI is PRIVATE, not being sold and will not be released!"
	Disclaimer.TextColor3 = Color3.fromRGB(255, 255, 255)
	Disclaimer.TextScaled = true
	Disclaimer.TextSize = 14.000
	Disclaimer.TextWrapped = true

	Username2.Name = "Username2"
	Username2.Parent = MFrame
	Username2.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	Username2.BackgroundTransparency = 0.500
	Username2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Username2.BorderSizePixel = 0
	Username2.Position = UDim2.new(0.5, 0, 0.119402982, 0)
	Username2.Size = UDim2.new(0.458999991, 0, 0.0726368204, 0)
	Username2.PlaceholderColor3 = Color3.fromRGB(188, 188, 188)
	Username2.PlaceholderText = "Target 2"
	Username2.Text = "Me"
	Username2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Username2.TextSize = 14.000
	Username2.TextWrapped = true

	Instruct.Name = "Instruct"
	Instruct.Parent = MFrame
	Instruct.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Instruct.BackgroundTransparency = 1.000
	Instruct.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Instruct.BorderSizePixel = 0
	Instruct.Position = UDim2.new(0, 0, 0.189999998, 0)
	Instruct.Size = UDim2.new(1, 0, 0.0418604352, 0)
	Instruct.ZIndex = 2
	Instruct.Text = [[1 is for the person you want to fling etc and 2 is for Bring and ETC]]
	Instruct.TextColor3 = Color3.fromRGB(255, 255, 255)
	Instruct.TextScaled = true
	Instruct.TextSize = 14.000
	Instruct.TextWrapped = true

	Selection.Name = "Toggle Click-To-Select"
	Selection.Parent = MFrame
	Selection.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	Selection.BackgroundTransparency = 0.500
	Selection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Selection.BorderSizePixel = 0
	Selection.Position = UDim2.new(0.0189275797, 0, 0.791387319, 0)
	Selection.Size = UDim2.new(0.298909813, 0, 0.0500000007, 0)
	Selection.ZIndex = 2
	Selection.Text = "Toggle Click-To-Select"
	Selection.TextColor3 = Color3.fromRGB(255, 255, 255)
	Selection.TextScaled = true
	Selection.TextSize = 14.000
	Selection.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	Selection.TextWrapped = true

	FastCheck.Name = "Fast Check"
	FastCheck.Parent = MFrame
	FastCheck.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
	FastCheck.BackgroundTransparency = 0.500
	FastCheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FastCheck.BorderSizePixel = 0
	FastCheck.Position = UDim2.new(0.0189275797, 0, 0.860482454, 0)
	FastCheck.Size = UDim2.new(0.298909813, 0, 0.0500000007, 0)
	FastCheck.ZIndex = 2
	FastCheck.Text = "Fast Check"
	FastCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
	FastCheck.TextScaled = true
	FastCheck.TextSize = 14.000
	FastCheck.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	FastCheck.TextWrapped = true

	TextLabel_3.Parent = Selection
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_3.BorderSizePixel = 0
	TextLabel_3.Size = UDim2.new(1, 0, 1, 0)
	TextLabel_3.Text = "Toggle Click-To-Select"
	TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.TextScaled = true
	TextLabel_3.TextSize = 14.000
	TextLabel_3.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.TextWrapped = true

	TS:Create(MFrame, TweenInfo.new(0.5), {Size = UDim2.new(0.19, 0,0.399, 0)}):Play()
end

--/> Functions
local function fullbreakvel()
    if localPlayer.Character then
        for i, v in localPlayer.Character:GetDescendants() do
            if v:IsA("BasePart") then
                v.AssemblyAngularVelocity = Vector3.new()
                v.AssemblyLinearVelocity = Vector3.new()
                v.RotVelocity = Vector3.new()
                v.Velocity = Vector3.new()
            end
        end
    end
end

function removeAligns()
	if not flingPart then return end
    --flingPart:ClearAllChildren()
end

local bp
function addAligns()
	if not flingPart then return end
    bp = flingPart:FindFirstChild("BodyPosition")
    if bp then
		bp:Destroy()
    end
    local bg = flingPart:FindFirstChild("BodyGyro")
    if bg then
        bg:Destroy()
    end

	--[[removeAligns()

	if AP == nil and AO == nil then
		local Attachment
		Attachment = Instance.new("Attachment")
		Attachment.Parent = flingPart
		AP = Instance.new("AlignPosition")
		AP.Parent = flingPart

		AO = Instance.new("AlignOrientation")
		AO.Parent = flingPart

		AP.RigidityEnabled = false
		AP.ApplyAtCenterOfMass = false
		AP.MaxForce = 67752
		AP.MaxVelocity = math.huge/9e110
		AP.Mode = Enum.PositionAlignmentMode.OneAttachment
		AP.ReactionForceEnabled = false
		AP.Responsiveness = 200
		AP.Position = IdlePos

		AO.Mode = Enum.OrientationAlignmentMode.OneAttachment
		AO.MaxTorque = 67752
		AO.MaxAngularVelocity = math.huge/9e110
		AO.PrimaryAxisOnly = false
		AO.ReactionTorqueEnabled = false
		AO.Responsiveness = 200
		AO.RigidityEnabled = false
		AO.CFrame = CFrame.Angles(0,0,0)
	end]]
end

local function GetCharHeight(CH)
	local CFrame, Size = CH:GetBoundingBox()
	return Size.Y/2
end

--[[local function GetStandingPos(C)
    local nonCollideParts = {}
    for i, part in C:GetDescendants() do
        if part:IsA("BasePart") and not part.CanCollide then
            table.insert(nonCollideParts, {part = part, parent = part.Parent})
            part.Parent = nil
        end
    end
    local cf, size = C:GetBoundingBox()
    local standingPos = cf.p - Vector3.new(0, size.Y, 0)
    for i, v in nonCollideParts do
        v.part.Parent = v.parent
    end
    return standingPos
end]]

local function GetStandingPos(C)
	local hum = C:FindFirstChildWhichIsA("Humanoid")
	local hrp = C:FindFirstChild("HumanoidRootPart")
	local standingPos = hrp.CFrame - Vector3.new(0, hrp.Size.Y / 2 + hrp.Size.Y, 0)
    return standingPos
end

local function SetCheckStatus(Status)
	if Status == "Failed" then
		VULStatus.Text = "CURRENT STATUS: FAILED"
		VULStatus.TextColor3 = Color3.fromRGB(255, 71, 71)
		if flingPart then
			flingpart = nil
		end
		if getgenv().fp then
			getgenv().fp = nil
		end
	elseif Status == "Starting" then
		VULStatus.Text = "CURRENT STATUS: STARTING"
		VULStatus.TextColor3 = Color3.fromRGB(255, 231, 135)
    elseif Status == "Waiting" then
		VULStatus.Text = "CURRENT STATUS: WAITING"
		VULStatus.TextColor3 = Color3.fromRGB(255, 231, 135)
	elseif Status == "Checking" then
		VULStatus.Text = "CURRENT STATUS: CHECKING"
		VULStatus.TextColor3 = Color3.fromRGB(255, 138, 71)
	elseif Status == "Active" then
		VULStatus.Text = "STATUS: ACTIVE"
		VULStatus.TextColor3 = Color3.fromRGB(136, 255, 130)
	end
end

local function CheckStart()
	if RunningCheck == true then
		return
	end
	RunningCheck = true

	SetCheckStatus("Checking")

	if not (getgenv().fp and not getgenv().fp:IsDescendantOf(nil) or workspace:FindFirstChild("SatDeployed")) then
		if wasStreamingEnabled then
			--localPlayer:RequestStreamAroundAsync(Vector3.new(100, 3000, 0), 5)
			HumanoidRootPart.CFrame = CFrame.new(100, 3000, 0)
		end
		if RepStorage:FindFirstChild("BloxbizRemotes") and RepStorage:FindFirstChild("BloxbizRemotes"):FindFirstChild("CatalogOnApplyToRealHumanoid") then
			RepStorage:FindFirstChild("BloxbizRemotes"):WaitForChild("CatalogOnApplyToRealHumanoid"):FireServer(AccessoryTable)
		end
		if RepStorage:FindFirstChild("UpdateAvatar") then
			RepStorage:FindFirstChild("UpdateAvatar"):FireServer("wear", AccessoryTable.AccessoryData.AssetId)
		end
		if RepStorage:FindFirstChild("AvatarEditor") and RepStorage:FindFirstChild("AvatarEditor"):FindFirstChild("UpdateAvatar") then
			RepStorage:FindFirstChild("AvatarEditor"):FindFirstChild("UpdateAvatar"):FireServer("wear", AccessoryTable.AccessoryData.AssetId)
		end
		if RepStorage:FindFirstChild("__network") and RepStorage:FindFirstChild("__network"):FindFirstChild("applyHumanoidDescription__set") then
			RepStorage:WaitForChild("__network"):FindFirstChild("applyHumanoidDescription__set"):FireServer(unpack(args))
		end
		if RepStorage:FindFirstChild("HDAdminClient") then
			RepStorage.HDAdminClient.Signals.RequestCommand:InvokeServer(";hat me 4640898")
			RepStorage.HDAdminClient.Signals.RequestCommand:InvokeServer(":hat me 4640898")
			RepStorage.HDAdminClient.Signals.RequestCommand:InvokeServer("hat me 4640898")
		end
		--[[
		if localPlayer.PlayerGui:FindFirstChild("Chat") then
			game.Players:Chat("/e !avataritem 4640898")
		end
		]]
		if workspace and workspace:FindFirstChild("Terrain") and workspace:FindFirstChild("Terrain"):FindFirstChild("_Game") and workspace:FindFirstChild("Terrain"):FindFirstChild("_Game"):FindFirstChild("Admin") then
			game.Players:Chat("hat me 4640898")
		end
		if RepStorage:FindFirstChild("Remotes") and RepStorage:FindFirstChild("Remotes"):FindFirstChild("Avatar") and RepStorage:FindFirstChild("Remotes"):FindFirstChild("Avatar"):FindFirstChild("SetAssetsEquipped") then
			RepStorage:WaitForChild("Remotes"):WaitForChild("Avatar"):WaitForChild("SetAssetsEquipped"):InvokeServer(unpack(args2))
		end
		if RepStorage:FindFirstChild("EditorAvatar") and RepStorage:FindFirstChild("EditorAvatar"):FindFirstChild("Remotes") and RepStorage:FindFirstChild("EditorAvatar"):FindFirstChild("Remotes"):FindFirstChild("RemoteFunction") then
			RepStorage:WaitForChild("EditorAvatar"):WaitForChild("Remotes"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args4))
		end
		if RepStorage:FindFirstChild("AvatarEditor") and RepStorage:FindFirstChild("AvatarEditor"):FindFirstChild("RemoteEvent") then
			RepStorage:WaitForChild("AvatarEditor"):WaitForChild("RemoteEvent"):FireServer(unpack(args5))
		end
		if RepStorage:FindFirstChild("Events") and RepStorage:FindFirstChild("Events"):FindFirstChild("Wear") then
			RepStorage:WaitForChild("Events"):WaitForChild("Wear"):InvokeServer(unpack(args6))
		end
		if RepStorage:FindFirstChild("Events") and RepStorage:FindFirstChild("Events"):FindFirstChild("updateCharacter") then
			RepStorage:WaitForChild("Events"):WaitForChild("updateCharacter"):InvokeServer(unpack(args7))
		end
		if RepStorage:FindFirstChild("Events") and RepStorage:FindFirstChild("Events"):FindFirstChild("Description_SetDescription") then
			RepStorage:WaitForChild("Events"):WaitForChild("Description_SetDescription"):InvokeServer(unpack(args9))
		end
		if RepStorage:FindFirstChild("AvatarEditor") and RepStorage:FindFirstChild("AvatarEditor"):FindFirstChild("RemoteFunction") then
			RepStorage:WaitForChild("AvatarEditor"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args10))
		end
		if RepStorage:FindFirstChild("CatalogGuiRemote") then
			RepStorage:WaitForChild("CatalogGuiRemote"):InvokeServer(unpack(args11))
		end
		if RepStorage:FindFirstChild("RE") and RepStorage:FindFirstChild("RE"):FindFirstChild("1Updat1eAvata1r") then
			RepStorage:WaitForChild("RE"):WaitForChild("1Updat1eAvata1r"):FireServer(unpack(args12))
			local args = {
				[1] = "OCA"
			}
			task.wait(0.3)
			game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Avata1rOrigina1l"):FireServer(unpack(args))
			
		end
		if RepStorage:FindFirstChild("AvatarEditorConnections") and RepStorage:FindFirstChild("AvatarEditorConnections"):FindFirstChild("WearItem") then
			RepStorage:FindFirstChild("AvatarEditorConnections"):FindFirstChild("WearItem"):InvokeServer(unpack(args13))
		end
		if game.GameId == 4165164803 then
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ApplyOutfit"):InvokeServer(unpack(args14))
		end
		if RepStorage:FindFirstChild("PlayerChannel") then
			RepStorage.PlayerChannel:FireServer(unpack(g))
		end
		if ConnectionEvent then
			ConnectionEvent:FireServer(315,data,true)
		end
		if game.GameId == 112420803 then
			game.Players:Chat("hat me 4640898")
		end
		if game:GetService("ReplicatedStorage"):FindFirstChild("ScriptPackages") and game:GetService("ReplicatedStorage"):FindFirstChild("ScriptPackages"):FindFirstChild("Knit") then
			local args = {
				[1] = {
					["HatAccessory"] = "4640898",
				},
				[2] = true
			}
			game:GetService("ReplicatedStorage").ScriptPackages.Knit.Services.HumanoidDescriptionService.RE.LoadCharacterWithHumanoidDescription:FireServer(unpack(args))
			task.wait(0.3)
			game:GetService("ReplicatedStorage").ScriptPackages.Knit.Services.HumanoidDescriptionService.RE.LoadCharacterWithHumanoidDescription:FireServer()
		end
		if game.GameId == 383310974 then
			local fsysModule = game:GetService("ReplicatedStorage").Fsys
			local fsys = require(fsysModule)
			local function loader(name)
				local cache = getupvalue(fsys.load, 1);
				print('waiting for', name);
			
				repeat
					task.wait();
				until typeof(cache[name]) == 'table';
			
				return cache[name];
			end
			local routerClient = loader('RouterClient')
			local remotes = getupvalue(getfenv(routerClient.get).get_remote_from_cache, 1)
			local args = {
				[1] = "player",
				[2] = "hats",
				[3] = 4640898
			}
			remotes["AvatarAPI/PutOn"]:InvokeServer(unpack(args))
			task.wait(0.3)
			local args = {
				[1] = "player"
			}
			remotes["AvatarAPI/ResetToRobloxChar"]:FireServer(unpack(args))
		end
		if game.GameId == 321778215 then
			local args = {
				[1] = {
					["Id"] = 4640898,
					["Name"] = "Doombringer's Doombringer",
					["Disabled"] = true
				},
				[2] = "RobloxAccessory"
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Inventory"):WaitForChild("EquipItem"):InvokeServer(unpack(args))
		end
		if game.GameId == 4434528807 then
			local args = {
				[1] = "Update",
				[2] = {
					[1] = 4640898,
					[2] = "Doombringer's Doombringer"
				}
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Avatar"):FireServer(unpack(args))
			task.wait(1)
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Avatar"):FireServer(unpack(args))		
		end
		local OldCF = HumanoidRootPart.CFrame

		if wasStreamingEnabled then
			--localPlayer:RequestStreamAroundAsync(Vector3.new(100, 3000, 0), 5)
			HumanoidRootPart.CFrame = CFrame.new(100, 3000, 0)
		end
		local timepassed
		coroutine.wrap(function()
			task.wait(1)
			timepassed = true
		end)()
		while not workspace:FindFirstChild("SatDeployed") and game.Workspace.DescendantAdded:Wait() do
			if timepassed then
				SetCheckStatus("Failed")
				RunningCheck = false
			end
			if workspace:FindFirstChild("SatDeployed") then
				break
			end
		end
		if wasStreamingEnabled then
			character:FindFirstChild("HumanoidRootPart").CFrame = OldCF
			fullbreakvel()
			character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
		end
	end

	if getgenv().fp and not getgenv().fp:IsDescendantOf(nil) then
		flingPart = getgenv().fp
	else
		flingPart = workspace:FindFirstChild("SatDeployed")
		getgenv().fp = flingPart
	end

	if not flingPart then
		SetCheckStatus("Failed")
		RunningCheck = false
		return
	else
		print("[skibidi hacks] Part set to: "..flingPart:GetFullName())
	end

	SetCheckStatus("Starting")


	flingPart.CanCollide = false
	--flingPart.Transparency = 0

	if _G.SkibidiNetlessCon then
		_G.SkibidiNetlessCon:Disconnect()
		_G.SkibidiNetlessCon = nil
	end

	removeAligns()
	
	local OldCF = HumanoidRootPart.CFrame

	print("[skibidi hacks] tping to part")
    local alreadyclaimed = false
	for i = 1, 500 do
		if isnetworkowner(flingPart) then
			flingPart.AssemblyLinearVelocity = Vector3.zero
			flingPart.AssemblyAngularVelocity = Vector3.zero
			if FastCheckToggle then
                if i == 1 then
                    alreadyclaimed = true
                end
				break
			end
		end
		HumanoidRootPart.CFrame = flingPart.CFrame
		game:GetService("RunService").PostSimulation:Wait()
	end

	print("[skibidi hacks] done tping")

	if isnetworkowner(flingPart) and not alreadyclaimed then
		SetCheckStatus("Active")
        for i = 1, 50 do
            flingPart.CFrame = OldCF
            character:FindFirstChild("HumanoidRootPart").CFrame = OldCF
            fullbreakvel()
            game:GetService("RunService").PostSimulation:Wait()
        end
		character:FindFirstChild("HumanoidRootPart").CFrame = OldCF
		fullbreakvel()
		character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
	else
		SetCheckStatus("Failed")
		RunningCheck = false
		character:FindFirstChild("HumanoidRootPart").CFrame = OldCF
		fullbreakvel()
        character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
		return
	end

	_G.SkibidiNetlessCon = RunService.PostSimulation:Connect(function()
		if isnetworkowner(flingPart) then
			flingPart.Velocity = NetlessVel
			if IdleTeleporting then
				flingPart.CFrame = IdlePos
			end
		end
	end)

	print("[skibidi hacks] we got net baby")

	task.spawn(function()
		while flingPart and flingPart.Parent do
			if not isnetworkowner(flingPart) then
				SetCheckStatus("Failed")
				RunningCheck = false
				break
			end
			game:GetService("RunService").PostSimulation:Wait()
		end
		SetCheckStatus("Failed")
		RunningCheck = false
	end)

	removeAligns()
	addAligns()

	print("[skibidi hacks] created aligns")

	--[[if wasStreamingEnabled then
		print("[skibidi hacks] SteamingEnabled mode (by loadlua)")
		local speedinTime = (HumanoidRootPart.Position - OldCF.Position).Magnitude/SETweenSpeed
		TS:Create(HumanoidRootPart,TweenInfo.new(speedinTime,Enum.EasingStyle.Linear),{CFrame = OldCF}):Play()
		
		whileloop = coroutine.create(function()
			while (HumanoidRootPart.Position - OldCF.Position).Magnitude >= 10 do
				wait()
				local CF = (HumanoidRootPart.CFrame * CFrame.new(0,-5,0)) * CFrame.Angles(math.rad(90),0,0)
				flingPart.CFrame = CF
				HumanoidRootPart.Velocity = Vector3.zero
			end
			wait()
			if LoadingScreen then
				LoadingScreen:Destroy()
			end
			wait(0.5)
			--flingPart.CFrame = CFrame.new(100, offset, 0)
		end)
		coroutine.resume(whileloop)
	else
		print("[skibidi hacks] regular mode")
	end]]
	
	RunningCheck = false
end

Selection.MouseButton1Click:Connect(function()
	clicktoselect = not clicktoselect
	if clicktoselect then
		Selection.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
	else
		Selection.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end
end)

FastCheck.MouseButton1Click:Connect(function()
	FastCheckToggle = not FastCheckToggle
	if FastCheckToggle then
		FastCheck.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
	else
		FastCheck.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end
end)

VulCheck.MouseButton1Click:Connect(function()
	CheckStart()
end)

AutoRet.MouseButton1Click:Connect(function()
	if AutoRet.BackgroundColor3 == Color3.fromRGB(218, 44, 44) then
		if whileloop then
			coroutine.close(whileloop)
			whileloop = nil
		end
		AutoRet.BackgroundColor3 = Color3.fromRGB(131, 255, 135)
	else
		AutoRet.BackgroundColor3 = Color3.fromRGB(218, 44, 44)
		--[[task.spawn(function()
			while AutoRet.BackgroundColor3 == Color3.fromRGB(218, 44, 44) do
				if RunningCheck == false and (VULStatus.Text ==  "CURRENT STATUS: FAILED" or VULStatus.Text ==  "CURRENT STATUS: INACTIVE") then
					CheckStart()
					break
				end
				task.wait(0.1)
			end
		end)]]
	end
end)

local Flying = false

local Buttons = {
	["Fling"] = function(TempClone)
		if wasStreamingEnabled then
			print("flinging while streamingenabled is not recommended")
			return
		end
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		for i,v in ipairs(game.Players:GetPlayers())  do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname) or string.lower(plrname) == "all" then
				local Target = v
				if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
					local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
					for i = 1, 30 do
						if not (TargetHumanoidRootPart and TargetHumanoidRootPart:IsDescendantOf(ws) and not TargetHumanoidRootPart:IsGrounded() and TargetHumanoidRootPart.AssemblyLinearVelocity.magnitude < 100) then
							break
						end
						flingPart.Position = TargetHumanoidRootPart.Position + TargetHumanoidRootPart.AssemblyLinearVelocity * 0.6
						flingPart.Orientation = Vector3.new(flingPart.Orientation.X, 0, flingPart.Orientation.Z)
                        flingPart.RotVelocity = Vector3.new(10e30, 0, 10e30)
						game:GetService("RunService").PostSimulation:Wait()
					end

					flingPart.CFrame = CFrame.new(100, offset, 0) * CFrame.Angles(0,0,0)
					if VULStatus.Text == "CURRENT STATUS: FAILED" or Using == false then
						break
					end
				end
			end
		end
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Local Fling"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		Flinging = true
		while Flinging do
			if VULStatus.Text == "CURRENT STATUS: FAILED" or Using == false then break end
			flingPart.Position = HumanoidRootPart.Position
			flingPart.Orientation = Vector3.new(flingPart.Orientation.X, 0, flingPart.Orientation.Z)
			flingPart.RotVelocity = Vector3.new(10e30, 0, 10e30)
			game:GetService("RunService").PostSimulation:Wait()
		end
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Bring"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		for i,v in ipairs(game.Players:GetPlayers())  do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname)  or (string.lower(plrname) == "all" and v ~= localPlayer) then
				local Target = v
				local Target2
				if string.lower(Username2.Text) == "me" then
					Target2 = localPlayer
				else
					for i,newpla in ipairs(game.Players:GetPlayers())  do
						if string.sub(string.lower(newpla.DisplayName),0,#Username2.Text) == string.lower(Username2.Text) or string.sub(string.lower(newpla.Name),0,#Username2.Text) == string.lower(Username2.Text) then
							Target2 = newpla
							break
						end
					end
				end
				if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
					local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
					flingPart.RotVelocity = Vector3.new(0, 0, 0)

					flingPart.CFrame = GetStandingPos(Target.Character) + (Target.Character.Humanoid.MoveDirection * Target.Character.Humanoid.WalkSpeed) * (0.95-(((0.95-0.6)/50)*i)) - Vector3.new(0,flingPart.Size.Y/2,0)
					--flingPart.CFrame = TargetHumanoidRootPart.CFrame + (Target.Character.Humanoid.MoveDirection * Target.Character.Humanoid.WalkSpeed) * (0.95-(((0.95-0.6)/50)*i)) - Vector3.new(0,flingPart.Size.Y/2 + GetCharHeight(Target.Character) + 0.1,0)
					game:GetService("RunService").PostSimulation:Wait()
					for i = 1, 10 do
						flingPart.CFrame = GetStandingPos(Target.Character) + (Target.Character.Humanoid.MoveDirection * Target.Character.Humanoid.WalkSpeed) * (0.95-(((0.95-0.6)/50)*i)) - Vector3.new(0,flingPart.Size.Y/2 - 0.3,0)
						--flingPart.CFrame = TargetHumanoidRootPart.CFrame + (Target.Character.Humanoid.MoveDirection * Target.Character.Humanoid.WalkSpeed) * (0.95-(((0.95-0.6)/50)*i)) - Vector3.new(0,flingPart.Size.Y/2 + GetCharHeight(Target.Character) + 0.1,0)
						game:GetService("RunService").PostSimulation:Wait()
					end
					local pos = Target2.Character.HumanoidRootPart.Position + Vector3.new(0,1000,0)
					for i = 1, 50 do
						flingPart.Position = pos
						game:GetService("RunService").PostSimulation:Wait()
					end
					for i = 1, 5 do
						flingPart.CFrame = GetStandingPos(Target2.Character) - Vector3.new(0,flingPart.Size.Y/2,0)
						game:GetService("RunService").PostSimulation:Wait()
					end
					for i = 1, 5 do
						flingPart.CFrame = GetStandingPos(Target2.Character) - Vector3.new(0,flingPart.Size.Y/2 + 5,0)
						game:GetService("RunService").PostSimulation:Wait()
					end

					if VULStatus.Text == "CURRENT STATUS: FAILED" or Using == false then
						break
					end
				end
			end
		end
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Go-To"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		for i,v in ipairs(game.Players:GetPlayers())  do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname)  or string.lower(plrname) == "all" then
				local Target = v
				local Target2
				if string.lower(Username2.Text) == "me" then
					Target2 = localPlayer
				else
					for i, newpla in ipairs(game.Players:GetPlayers())  do
						if string.sub(string.lower(newpla.DisplayName),0,#Username2.Text) == string.lower(Username2.Text) or string.sub(string.lower(newpla.Name),0,#Username2.Text) == string.lower(Username2.Text) then
							Target2 = newpla
							break
						end
					end
				end
				if Target2 == localPlayer then
					if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
						local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
						character:FindFirstChild("HumanoidRootPart").CFrame = TargetHumanoidRootPart.CFrame
					end
				else
					local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
					flingPart.RotVelocity = Vector3.new(0, 0, 0)

					for i = 1, 50 do
						flingPart.CFrame = CFrame.new((Target2.Character:FindFirstChild("HumanoidRootPart").Position - Vector3.new(0,flingPart.Size.X/2-TargetHumanoidRootPart.Size.Y/2/2 + GetCharHeight(Target2.Character),0))) * CFrame.Angles(0,0,0)
						game:GetService("RunService").PostSimulation:Wait()
					end

					flingPart.CFrame = CFrame.new((Target2.Character:FindFirstChild("HumanoidRootPart").Position + Vector3.new(0,1000,0))) * CFrame.Angles(0,0,0)

					task.wait(0.1)

					for i = 1, 10 do
						flingPart.CFrame = CFrame.new((TargetHumanoidRootPart.Position - Vector3.new(0,8.5 + GetCharHeight(Target.Character) + 0.1,0))) * CFrame.Angles(0,0,0)
						game:GetService("RunService").PostSimulation:Wait()
					end

					task.wait(0.05)
					flingPart.CFrame = CFrame.new((TargetHumanoidRootPart.Position - Vector3.new(0,8.5 + GetCharHeight(Target.Character) + 0.1,0))) * CFrame.Angles(math.rad(90),0,0)

					if VULStatus.Text == "CURRENT STATUS: FAILED" or Using == false then
						break
					end
				end
			end
		end
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Void"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		for i,v in ipairs(game.Players:GetPlayers())  do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname)  or string.lower(plrname) == "all" then
				local Target = v
				if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
					local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
					flingPart.RotVelocity = Vector3.new(0, 0, 0)

					for i = 1, 50 do
						flingPart.CFrame = TargetHumanoidRootPart.CFrame + TargetHumanoidRootPart.AssemblyLinearVelocity * 0.6 - Vector3.new(0,flingPart.Size.Y/2 + GetCharHeight(Target.Character) + 0.1,0)
						game:GetService("RunService").PostSimulation:Wait()
					end

					local Pos = TargetHumanoidRootPart.Position + Vector3.new(0, 1000, 0)
					flingPart.CFrame = CFrame.new(Pos) * CFrame.Angles(0,0,0)
					task.wait(0.1)
					Pos = Pos + Vector3.new(0,0,1000)
					flingPart.CFrame = CFrame.new(Pos) * CFrame.Angles(0,0,0)
					task.wait(0.1)
					Pos = Vector3.new(Pos.X,workspace.FallenPartsDestroyHeight+10,Pos.Z)
					flingPart.CFrame = CFrame.new(Pos) * CFrame.Angles(0,0,0)
					task.wait(0.1)
					for i = 1, 10 do
						flingPart.RotVelocity = Vector3.new(-100, -100, 100)
						game:GetService("RunService").PostSimulation:Wait()
					end

					if VULStatus.Text == "CURRENT STATUS: FAILED" or Using == false then
						break
					end
				end
			end
		end
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Skydive"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		for i,v in ipairs(game.Players:GetPlayers()) do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname)  or string.lower(plrname) == "all" then
				local Target = v
				local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
				flingPart.RotVelocity = Vector3.new(0, 0, 0)
				
				for i = 1, 50 do
					flingPart.CFrame = TargetHumanoidRootPart.CFrame + TargetHumanoidRootPart.AssemblyLinearVelocity * 0.6 - Vector3.new(0,flingPart.Size.Y/2 + GetCharHeight(Target.Character) + 0.1,0)
					game:GetService("RunService").PostSimulation:Wait()
				end

				if VULStatus.Text == "STATUS: FAILED" or Using == false then
					break
				end
			end
		end
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Rocket Ship"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		FlightFuncs.sFLY(false)
		--flingPart.Transparency = 0

		Flying = true
		bp.MaxForce = Vector3.zero
		while Flying do
			
			local d = flingPart.Size.X - HumanoidRootPart.Size.Y + HumanoidRootPart.Size.Y/3
			local CF = (HumanoidRootPart.CFrame * CFrame.new(0,-d,0) )* CFrame.Angles(math.rad(90),0,0)
			flingPart.CFrame = CF
			flingPart.Velocity = Vector3.zero
			flingPart.RotVelocity = Vector3.zero
			--flingPart.Orientation = Vector3.new(math.rad(90),0,0)
			game:GetService("RunService").PostSimulation:Wait()
		end
		FlightFuncs.NOFLY()
		character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
		--flingPart.Transparency = 1 
		Flying = false
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Pillar"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		--flingPart.Transparency = 0


		for i,v in ipairs(game.Players:GetPlayers())  do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname)  or string.lower(plrname) == "all" then
				local Target = v
				if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
					local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
					flingPart.RotVelocity = Vector3.new(0, 0, 0)
					local NewCF = 0
					for i = 1, 10 do
						flingPart.CFrame = TargetHumanoidRootPart.CFrame + TargetHumanoidRootPart.AssemblyLinearVelocity * 0.6 - Vector3.new(0,flingPart.Size.Y/2 + GetCharHeight(Target.Character) + 0.1,0)
						flingPart.CFrame = CFrame.new((TargetHumanoidRootPart.Position - Vector3.new(0,8.3 + GetCharHeight(Target.Character) + 0.1,0))) * CFrame.Angles(0,0,0)
						game:GetService("RunService").PostSimulation:Wait()
					end

					for i = 1, 200 do
						flingPart.CFrame = ((CFrame.new(TargetHumanoidRootPart.Position.X,flingPart.CFrame.Position.Y,TargetHumanoidRootPart.Position.Z)) * CFrame.new(0,0.5,0)) * CFrame.Angles(0,0,0)
						game:GetService("RunService").PostSimulation:Wait()
					end

					if VULStatus.Text == "CURRENT STATUS: FAILED" or Using == false then
						break
					end
				end
			end
		end
		--flingPart.Transparency = 1
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["Blame"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		for i,v in ipairs(game.Players:GetPlayers())  do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname) then
				Blaming = true

				local Target = v
				while Blaming do
					if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
						local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
						local pos = TargetHumanoidRootPart.CFrame * CFrame.new(0,0,-16)
						flingPart.Position = pos.Position + TargetHumanoidRootPart.Velocity
						flingPart.RotVelocity = Vector3.new(1500, -1500, 1500)
                        game:GetService("RunService").PostSimulation:Wait()
					end
				end
				IdleTeleporting = true
				Blaming = false
				TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
				break
			end
		end
	end,
	["Stuck"] = function(TempClone)
		TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
		IdleTeleporting = false
		local plrname = Username1.Text
		for i,v in ipairs(game.Players:GetPlayers()) do
			if string.sub(string.lower(v.DisplayName),0,#plrname) == string.lower(plrname) or string.sub(string.lower(v.Name),0,#plrname) == string.lower(plrname)  or string.lower(plrname) == "all" then
				local Target = v
				local TargetHumanoidRootPart = Target.Character:FindFirstChild("HumanoidRootPart")
				flingPart.RotVelocity = Vector3.new(0, 0, 0)

				local old = NetlessVel

				NetlessVel = Vector3.new(0, -100, 0)
				
				for i = 1, 20 do
					flingPart.CFrame = TargetHumanoidRootPart.CFrame + TargetHumanoidRootPart.AssemblyLinearVelocity * 0.6 + Vector3.new(0,flingPart.Size.Y/2 + GetCharHeight(Target.Character),0)
					game:GetService("RunService").PostSimulation:Wait()
				end

				for i = 1, 50 do
					flingPart.CFrame = TargetHumanoidRootPart.CFrame + TargetHumanoidRootPart.AssemblyLinearVelocity * 0.6 + Vector3.new(0,flingPart.Size.Y/2 - GetCharHeight(Target.Character),0)
					game:GetService("RunService").PostSimulation:Wait()
				end

				NetlessVel = old

				if VULStatus.Text == "STATUS: FAILED" or Using == false then
					break
				end
			end
		end
		IdleTeleporting = true
		TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
	end,
	["View Part"] = function(TempClone)
        --flingPart.Transparency = 0
		if TempClone.BackgroundColor3 == Color3.fromRGB(157, 255, 152) then
			TempClone.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
			workspace.Camera.CameraSubject = localPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		else
			if not flingPart then return end
			TempClone.BackgroundColor3 = Color3.fromRGB(157, 255, 152)
			workspace.Camera.CameraSubject = flingPart
		end
	end,
	--[[["Arm"] = function(TempClone)
		if VULStatus.Text == "CURRENT STATUS: FAILED" then return end
        --flingPart.Transparency = 0
		if character:FindFirstChild("Lower Torso") then return end -- is r15 so i return, because i dont feel like supporting r15 rn - @loadlua
		if character:FindFirstChild("Humanoid") then
			IdleTeleporting = false
			NetlessVel = Vector3.new(1000, 0, 1000)
			local con = game:GetService("RunService").PostSimulation:Connect(function()
				flingPart.CFrame = character["Right Arm"].CFrame * CFrame.new(0,-5,0)
			end)
			local anim = Instance.new("Animation")
			anim.AnimationId = 'rbxassetid://204062532'
			local track = character.Humanoid:LoadAnimation(anim)
			track:AdjustSpeed(3)
			track:Play()
			track.Ended:Wait()
			con:Disconnect()
			con = nil
			NetlessVel = OGNetlessVel
			flingPart.AssemblyAngularVelocity = Vector3.new()
			flingPart.AssemblyLinearVelocity = Vector3.new()
			flingPart.RotVelocity = Vector3.new()
			flingPart.Velocity = Vector3.new()
			IdleTeleporting = true
		end
	end,]]
    ["Give Tools"] = function()
		buildoffset = CFrame.new(0,1,-10) * CFrame.Angles(0,0,math.rad(-90))

		if not handles then
			handles = {
				left = Instance.new("ConeHandleAdornment",localPlayer.PlayerGui),
				right = Instance.new("ConeHandleAdornment",localPlayer.PlayerGui),
				up = Instance.new("ConeHandleAdornment",localPlayer.PlayerGui),
				down = Instance.new("ConeHandleAdornment",localPlayer.PlayerGui),
				forward = Instance.new("ConeHandleAdornment",localPlayer.PlayerGui),
				back = Instance.new("ConeHandleAdornment",localPlayer.PlayerGui)
			}
		end

		do
			handles.left.CFrame = CFrame.new(flingPart.Size.X-1,0,0) * CFrame.Angles(0,math.rad(-90),0)
			handles.right.CFrame = CFrame.new(-(flingPart.Size.X-1),0,0) * CFrame.Angles(0,math.rad(90),0)
			handles.up.CFrame = CFrame.new(0,flingPart.Size.Y/1.5,0) * CFrame.Angles(math.rad(90),0,0)
			handles.down.CFrame = CFrame.new(0,-flingPart.Size.Y/1.5,0) * CFrame.Angles(math.rad(-90),0,0)
			handles.forward.CFrame = CFrame.new(0,0,-flingPart.Size.Z) * CFrame.Angles(0,0,0)
			handles.back.CFrame = CFrame.new(0,0,flingPart.Size.Z) * CFrame.Angles(0,math.rad(-180),0)
		end

		for i,v in pairs(handles) do
			v.Adornee = flingPart
			v.Visible = false
			v.MouseButton1Down:Connect(function()
				buildoffset = buildoffset * CFrame.new(v.CFrame.Position)
			end)
		end
        --local punchcon
		local Tools = {
			["Arm"] = 
			{
                Equipped = function()
					IdleTeleporting = false
					if character:FindFirstChild("Right Arm") then
						punchcon = game:GetService("RunService").PostSimulation:Connect(function()
							flingPart.CFrame = character["Right Arm"].CFrame * CFrame.new(2,-7,0)
						end)
					elseif character:FindFirstChild("RightUpperArm") then
						punchcon = game:GetService("RunService").PostSimulation:Connect(function()
							flingPart.CFrame = character["RightUpperArm"].CFrame * CFrame.new(2,-7,0)
						end)
					end
				end,
				Unequipped = function()
                    punchcon:Disconnect()
                    punchcon = nil
					IdleTeleporting = true
				end,
				Activated = function()
                    --flingPart.Transparency = 0
                    if character:FindFirstChild("Lower Torso") then return end -- is r15 so i return, because i dont feel like supporting r15 rn - @loadlua
                    if character:FindFirstChild("Humanoid") then
                        NetlessVel = Vector3.new(0, -1e5, 0)
						local speed = 1
                        local anim = Instance.new("Animation")
						if character:FindFirstChild("Right Arm") then
							anim.AnimationId = "rbxassetid://204062532"
						elseif character:FindFirstChild("RightUpperArm") then
							speed = -3
							anim.AnimationId = "rbxassetid://698251653"
						end
                        local track = character.Humanoid:LoadAnimation(anim)
                        track:Play(0, 1, speed)
                        track.Ended:Wait()
                        --track.DidLoop:Wait()
                        --track:Stop()
                        NetlessVel = OGNetlessVel
                        flingPart.AssemblyAngularVelocity = Vector3.new()
                    end
				end
			},
			["Mouse Fling"] = 
			{
				Equipped = function()
					IdleTeleporting = false
					flingPart.CanQuery = false
					flingPart.CanTouch = false
                    cursorflingcon = game:GetService("RunService").PostSimulation:Connect(function()
                        flingPart.Position = mouse.Hit.p
						flingPart.Orientation = Vector3.new(flingPart.Orientation.X, 0, flingPart.Orientation.Z)
                        flingPart.RotVelocity = Vector3.new(10e30, 0, 10e30)
                    end)
				end,
				Unequipped = function()
                    flingPart.CanQuery = true
					flingPart.CanTouch = true
                    cursorflingcon:Disconnect()
                    cursorflingcon = nil
                    flingPart.AssemblyAngularVelocity = Vector3.new()
                    flingPart.AssemblyLinearVelocity = Vector3.new()
                    flingPart.RotVelocity = Vector3.new()
                    flingPart.Velocity = Vector3.new()
					IdleTeleporting = true
				end,
				Activated = function()

				end
			},
			["Collision"] = 
			{
				Equipped = function()
					IdleTeleporting = false
					--flingPart.Transparency = 0
					if punchthread then return end
					if wavethread then return end
					if armthread then return end
					if collisionthread then return end
					if character:FindFirstChild("Lower Torso") then return end -- is r15 so i return, because i dont feel like supporting r15 rn - @loadlua
					collisionthread = coroutine.create(function()
						while collisionthread ~= nil do
							task.wait() -- hi @DigitalityScripts i did this to make u happy :3 - @loadlua
							local breakforloop = false
							for i,v in ipairs(Players:GetPlayers()) do
								if breakforloop then continue end
								if v.Name ~= localPlayer.Name and v.Character then
									local myhrp = character:FindFirstChild("HumanoidRootPart")
									local theirhrp = v.Character:FindFirstChild("HumanoidRootPart")
									if myhrp and theirhrp then
										local mag = (myhrp.Position-theirhrp.Position).Magnitude

										if mag <= 7 then
											breakforloop = true
											flingPart.CFrame = myhrp.CFrame
											break
										end
									end
								end
							end
							if not breakforloop then
								flingPart.CFrame = CFrame.new(100, offset, 0)
							end
						end
					end)
					coroutine.resume(collisionthread)
				end,
				Unequipped = function()
					if not collisionthread then return end
					coroutine.close(collisionthread)
					collisionthread = nil
					task.wait(0.1)
					flingPart.CFrame = CFrame.new(100, offset, 0)
					IdleTeleporting = true
				end,
				Activated = function()
				end
			},
		}

		for i,v in ipairs(localPlayer.Backpack:GetChildren()) do
			if table.find(Tools,v.Name) then
				v:Destroy()
			end
		end
		for i,v in ipairs(character:GetChildren()) do
			if table.find(Tools,v.Name) then
				v:Destroy()
			end
		end
		for name,funcs in pairs(Tools) do
			local tool = Instance.new("Tool",localPlayer.Backpack)
			tool.Name = name
			tool.RequiresHandle = false
			tool.Equipped:Connect(function()
				funcs.Equipped()
			end)
			tool.Unequipped:Connect(function()
				funcs.Unequipped()
			end)
			tool.Activated:Connect(function()
				funcs.Activated()
			end)
		end
	end
}

for i, Button in pairs(Buttons) do
	local TempClone = Template:Clone()
	TempClone.TextLabel.Text = i
	TempClone.Name = i
	TempClone.Visible = true
	TempClone.Parent = ScrollingFrame

	TempClone.MouseButton1Click:Connect(function()
        if i == "View Part" then Button(TempClone) return end
		character = localPlayer.Character
		HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if Using == true then
			Using = false
			return
		end
		Using = true
		Button(TempClone)
		Using = false
	end)
end

localPlayer.CharacterAdded:Connect(function(Char)
	character = Char
	HumanoidRootPart = Char:WaitForChild("HumanoidRootPart")
	if _G.SkibidiNetlessCon then
		_G.SkibidiNetlessCon:Disconnect()
		_G.SkibidiNetlessCon = nil
	end
end)

mouse.Button1Down:Connect(function()
	local target = mouse.Target

	if not clicktoselect then return end
	if not Players:GetPlayerFromCharacter(target.Parent) then return end
	if ctsDebounce then return end

	if target.Parent:FindFirstChild("Humanoid") and target.Parent ~= workspace then
		ctsDebounce = true
		Username1.Text = target.Parent.Name
		ctsHighlight.Parent = target.Parent
		ctsHighlight.FillTransparency = 0
		ctsHighlight.OutlineTransparency = 0
		wait(0.5)
		ctsHighlight.FillTransparency = 1
		ctsHighlight.OutlineTransparency = 1
		wait(0.1)
		ctsDebounce = false
	end
end)
