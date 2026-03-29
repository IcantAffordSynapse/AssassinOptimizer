-- Assassin Optimizer
-- 29/03/2026

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

local PlaceId = 860428890
local Cursor = ""

if getgenv().Config.ReduceLag then
    spawn(function()
        if identifyexecutor() == "Xeno" then
            local gui = Instance.new("ScreenGui")
            gui.Name = "UnsupportedUI"
            gui.ResetOnSpawn = false
            gui.Parent = game:GetService("CoreGui")

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(0, 300, 0, 140)
            frame.Position = UDim2.new(0.5, -150, 0.5, -70)
            frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
            frame.BorderSizePixel = 0
            frame.Parent = gui

            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, -20, 0, 60)
            text.Position = UDim2.new(0, 10, 0, 10)
            text.BackgroundTransparency = 1
            text.Text = "ReduceLag is not supported on Xeno executor."
            text.TextColor3 = Color3.new(1,1,1)
            text.TextWrapped = true
            text.TextScaled = true
            text.Font = Enum.Font.SourceSansBold
            text.Parent = frame

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 35)
            button.Position = UDim2.new(0.5, -50, 1, -45)
            button.Text = "OK"
            button.BackgroundColor3 = Color3.fromRGB(60,60,60)
            button.TextColor3 = Color3.new(1,1,1)
            button.Font = Enum.Font.SourceSansBold
            button.TextScaled = true
            button.Parent = frame

            button.MouseButton1Click:Connect(function()
                gui:Destroy()
            end)
        else
            for i, v in pairs(getgc(true)) do
                if type(v) == "function" and getinfo(v).name == "C1__" then
                    debug.setconstant(v, 1, 0)
                end
            end
        end
    end)
end

if getgenv().Config.RemoveChat then
    spawn(function()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.UI.Chat:Destroy()
    end)
end

if getgenv().Config.ProServerFinder then
    spawn(function()
        local ProServer = Instance.new("ScreenGui")
        ProServer.Name = "ProServer"
        ProServer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ProServer.Parent = game:GetService("CoreGui")

        local MainFrame = Instance.new("Frame")
        MainFrame.AnchorPoint = Vector2.new(0, 1)
        MainFrame.Name = "MainFrame"
        MainFrame.Position = UDim2.new(0, 0, 1, 0)
        MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        MainFrame.Size = UDim2.new(0, 494, 0, 316)
        MainFrame.BorderSizePixel = 0
        MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        MainFrame.Parent = ProServer

        local Header = Instance.new("TextLabel")
        Header.TextWrapped = true
        Header.TextColor3 = Color3.fromRGB(255, 255, 255)
        Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Header.Text = "Pro Servers:"
        Header.Name = "Header"
        Header.Size = UDim2.new(0, 373, 0, 33)
        Header.Position = UDim2.new(0.022267205640673637, 0, 0.037974681705236435, 0)
        Header.BorderSizePixel = 0
        Header.BackgroundTransparency = 1
        Header.TextXAlignment = Enum.TextXAlignment.Left
        Header.TextSize = 14
        Header.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        Header.TextScaled = true
        Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Header.Parent = MainFrame

        local ServerContainer = Instance.new("ScrollingFrame")
        ServerContainer.Active = true
        ServerContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ServerContainer.ScrollBarThickness = 10
        ServerContainer.AnchorPoint = Vector2.new(0.5, 0.5)
        ServerContainer.BackgroundTransparency = 1
        ServerContainer.Position = UDim2.new(0.5, 0, 0.5696202516555786, 0)
        ServerContainer.Name = "ServerContainer"
        ServerContainer.Size = UDim2.new(0, 471, 0, 247)
        ServerContainer.BorderSizePixel = 0
        ServerContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ServerContainer.Parent = MainFrame

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Padding = UDim.new(0, 2)
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Parent = ServerContainer

        local ToggleButton = Instance.new("TextButton")
        ToggleButton.TextWrapped = true
        ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleButton.Text = "Close"
        ToggleButton.AnchorPoint = Vector2.new(0, 1)
        ToggleButton.Size = UDim2.new(0, 494, 0, 27)
        ToggleButton.Name = "ToggleButton"
        ToggleButton.BorderSizePixel = 0
        ToggleButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        ToggleButton.TextSize = 14
        ToggleButton.TextScaled = true
        ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleButton.Parent = MainFrame


        local UIToggled = true

        ToggleButton.MouseButton1Click:Connect(function()
            if UIToggled then
                UIToggled = false
                MainFrame.AnchorPoint = Vector2.new(0, 0)
                ToggleButton.Text = "Open"
            else
                UIToggled = true
                MainFrame.AnchorPoint = Vector2.new(0, 1)
                ToggleButton.Text = "Close"
            end
        end)

        local function AddServer(jobId, pCount)
            local ServerTemp = Instance.new("Frame")
            ServerTemp.BackgroundTransparency = 1
            ServerTemp.Name = "ServerTemp"
            ServerTemp.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ServerTemp.Size = UDim2.new(0, 450, 0, 42)
            ServerTemp.BorderSizePixel = 0
            ServerTemp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ServerTemp.Parent = ServerContainer

            local ServerStroke = Instance.new("UIStroke")
            ServerStroke.Color = Color3.fromRGB(255, 255, 255)
            ServerStroke.Name = "ServerStroke"
            ServerStroke.BorderStrokePosition = Enum.BorderStrokePosition.Inner
            ServerStroke.Parent = ServerTemp

            local JobIDLabel = Instance.new("TextLabel")
            JobIDLabel.TextWrapped = true
            JobIDLabel.Name = "JobIDLabel"
            JobIDLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            JobIDLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            JobIDLabel.Text = jobId
            JobIDLabel.Size = UDim2.new(0, 222, 0, 26)
            JobIDLabel.Position = UDim2.new(0.27244439721107483, 0, 0.5, 0)
            JobIDLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            JobIDLabel.BorderSizePixel = 0
            JobIDLabel.BackgroundTransparency = 1
            JobIDLabel.TextXAlignment = Enum.TextXAlignment.Left
            JobIDLabel.TextScaled = true
            JobIDLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            JobIDLabel.TextSize = 14
            JobIDLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            JobIDLabel.Parent = ServerTemp

            local PlayerCountLabel = Instance.new("TextLabel")
            PlayerCountLabel.TextWrapped = true
            PlayerCountLabel.Name = "PlayerCountLabel"
            PlayerCountLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            PlayerCountLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            PlayerCountLabel.Text = tostring(pCount) .. "/8"
            PlayerCountLabel.Size = UDim2.new(0, 38, 0, 26)
            PlayerCountLabel.Position = UDim2.new(0.6013332605361938, 0, 0.5, 0)
            PlayerCountLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            PlayerCountLabel.BorderSizePixel = 0
            PlayerCountLabel.BackgroundTransparency = 1
            PlayerCountLabel.TextXAlignment = Enum.TextXAlignment.Left
            PlayerCountLabel.TextScaled = true
            PlayerCountLabel.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            PlayerCountLabel.TextSize = 14
            PlayerCountLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PlayerCountLabel.Parent = ServerTemp

            local JoinBtn = Instance.new("TextButton")
            JoinBtn.TextWrapped = true
            JoinBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            JoinBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
            JoinBtn.Text = "Join"
            JoinBtn.BorderSizePixel = 0
            JoinBtn.AnchorPoint = Vector2.new(0.5, 0.5)
            JoinBtn.Size = UDim2.new(0, 124, 0, 30)
            JoinBtn.Name = "JoinBtn"
            JoinBtn.Position = UDim2.new(0.8410000205039978, 0, 0.5, 0)
            JoinBtn.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            JoinBtn.TextSize = 14
            JoinBtn.TextScaled = true
            JoinBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            JoinBtn.Parent = ServerTemp

            JoinBtn.MouseButton1Click:Connect(function()
                TeleportService:TeleportToPlaceInstance(
                    PlaceId,
                    jobId,
                    game:GetService("Players").LocalPlayer
                )
            end)
        end

        local function FetchServers()
            Cursor = ""

            for i, v in pairs(ServerContainer:GetChildren()) do
                if v:IsA("Frame") then
                    v:Destroy()
                end
            end

            local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Desc&limit=100"

            if Cursor ~= "" then
                url = url.."&cursor="..Cursor
            end

            local response = game:HttpGet(url)
            local data = HttpService:JSONDecode(response)

            Cursor = data.nextPageCursor or ""

            for _,server in pairs(data.data) do
                local players = server.playing
                local maxPlayers = server.maxPlayers
                local jobId = server.id

                AddServer(jobId, players)
            end

            
        end

        spawn(function()
            while true do
                FetchServers()
                wait(20)
            end
        end)
    end)
end
