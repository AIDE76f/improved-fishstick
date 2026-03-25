
-- [[ Kingdom Multiplier Mod Menu ]] --

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")

-- إعدادات الواجهة
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Name = "MultiplierMenu"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.05, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 220, 0, 160)
Frame.Active = true
Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

Title.Parent = Frame
Title.Text = "KINGDOM SPEED x1000"
Title.Size = UDim2.new(1, 0, 0, 45)
Title.TextColor3 = Color3.fromRGB(255, 85, 0) -- لون برتقالي ناري
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.BackgroundTransparency = 1

UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- وظيفة إنشاء الأزرار
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Frame
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 5)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

--- [ الأزرار المعدلة بالمضاعفات ] ---

-- 1. مضاعفة سرعة الإنتاج 1000 مرة
createButton("⚡ مضاعفة الإنتاج x1000", Color3.fromRGB(45, 45, 45), function()
    local count = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj.Name == "ProductionSpeed" or obj.Name == "ProductionDelay") and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
            -- الفكرة: تقسيم الوقت الحالي على 1000 لزيادة السرعة
            if obj.Value > 0 then
                obj.Value = obj.Value / 1000
                count = count + 1
            end
        end
    end
    print("تم تسريع الإنتاج بمقدار 1000 ضعف لعدد: " .. count)
end)

-- 2. مضاعفة سرعة البناء 1000 مرة
createButton("🏗️ مضاعفة البناء x1000", Color3.fromRGB(80, 0, 0), function()
    local count = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        -- مسميات شاملة لوقت البناء
        if (obj.Name == "BuildTime" or obj.Name == "BuildDelay" or obj.Name == "BuildSpeed" or obj.Name == "WaitTime") 
           and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
            
            if obj.Value > 0 then
                obj.Value = obj.Value / 1000
                count = count + 1
            end
        end
    end
    print("تم تسريع البناء بمقدار 1000 ضعف لعدد: " .. count)
end)

print("Multiplier Menu Loaded - Speed set to x1000 logic.")
