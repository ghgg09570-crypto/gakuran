-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Variables for Toggles
local espEnabled = false
local feature2Enabled = false
local autoBlockEnabled = false

-- Main GUI Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomExploitMenu"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Main Frame (Draggable & Collapsible)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 215)
MainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 8)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Control Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Collapse Button
local CollapseButton = Instance.new("TextButton")
CollapseButton.Size = UDim2.new(0, 30, 0, 30)
CollapseButton.Position = UDim2.new(1, -32, 0, 2)
CollapseButton.BackgroundTransparency = 1
CollapseButton.Text = "-"
CollapseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CollapseButton.TextSize = 18
CollapseButton.Font = Enum.Font.SourceSansBold
CollapseButton.Parent = TopBar

-- Content Container
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -35)
ContentFrame.Position = UDim2.new(0, 0, 0, 35)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Toggle 1 Button (ESP)
local Toggle1 = Instance.new("TextButton")
Toggle1.Size = UDim2.new(0, 200, 0, 35)
Toggle1.Position = UDim2.new(0, 10, 0, 10)
Toggle1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Toggle1.BorderSizePixel = 0
Toggle1.Text = "ESP: OFF"
Toggle1.TextColor3 = Color3.fromRGB(255, 100, 100)
Toggle1.TextSize = 14
Toggle1.Font = Enum.Font.SourceSansBold
Toggle1.Parent = ContentFrame

local Toggle1Corner = Instance.new("UICorner")
Toggle1Corner.CornerRadius = UDim.new(0, 6)
Toggle1Corner.Parent = Toggle1

-- Toggle 2 Button (Feature 2)
local Toggle2 = Instance.new("TextButton")
Toggle2.Size = UDim2.new(0, 200, 0, 35)
Toggle2.Position = UDim2.new(0, 10, 0, 55)
Toggle2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Toggle2.BorderSizePixel = 0
Toggle2.Text = "Feature 2: OFF"
Toggle2.TextColor3 = Color3.fromRGB(255, 100, 100)
Toggle2.TextSize = 14
Toggle2.Font = Enum.Font.SourceSansBold
Toggle2.Parent = ContentFrame

local Toggle2Corner = Instance.new("UICorner")
Toggle2Corner.CornerRadius = UDim.new(0, 6)
Toggle2Corner.Parent = Toggle2

-- Toggle 3 Button (Auto-Block)
local Toggle3 = Instance.new("TextButton")
Toggle3.Size = UDim2.new(0, 200, 0, 35)
Toggle3.Position = UDim2.new(0, 10, 0, 100)
Toggle3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Toggle3.BorderSizePixel = 0
Toggle3.Text = "Auto-Block: OFF"
Toggle3.TextColor3 = Color3.fromRGB(255, 100, 100)
Toggle3.TextSize = 14
Toggle3.Font = Enum.Font.SourceSansBold
Toggle3.Parent = ContentFrame

local Toggle3Corner = Instance.new("UICorner")
Toggle3Corner.CornerRadius = UDim.new(0, 6)
Toggle3Corner.Parent = Toggle3

-- Collapse Logic
local isCollapsed = false
CollapseButton.MouseButton1Click:Connect(function()
    isCollapsed = not isCollapsed
    ContentFrame.Visible = not isCollapsed
    if isCollapsed then
        MainFrame.Size = UDim2.new(0, 220, 0, 35)
        CollapseButton.Text = "+"
    else
        MainFrame.Size = UDim2.new(0, 220, 0, 215)
        CollapseButton.Text = "-"
    end
end)

-- Toggle 1 Logic
Toggle1.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        Toggle1.Text = "ESP: ON"
        Toggle1.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        Toggle1.Text = "ESP: OFF"
        Toggle1.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Toggle 2 Logic
Toggle2.MouseButton1Click:Connect(function()
    feature2Enabled = not feature2Enabled
    if feature2Enabled then
        Toggle2.Text = "Feature 2: ON"
        Toggle2.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        Toggle2.Text = "Feature 2: OFF"
        Toggle2.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Toggle 3 Logic
Toggle3.MouseButton1Click:Connect(function()
    autoBlockEnabled = not autoBlockEnabled
    if autoBlockEnabled then
        Toggle3.Text = "Auto-Block: ON"
        Toggle3.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        Toggle3.Text = "Auto-Block: OFF"
        Toggle3.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

-- Auto-Block Execution
RunService.RenderStepped:Connect(function()
    if autoBlockEnabled then
        pcall(function()
            VirtualUser:Button1Down(Vector2.new(0,0))
            task.wait()
            VirtualUser:Button1Up(Vector2.new(0,0))
        end)
    end
end)
