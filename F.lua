-- [[ Kingdom Speed Mod Menu ]] --

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")

-- إعدادات الواجهة الأساسية
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Name = "SpeedMenu"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.05, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 200, 0, 160) -- صغرنا الحجم بعد حذف الزر
Frame.Active = true
Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

Title.Parent = Frame
Title.Text = "KINGDOM SPEED"
Title.Size = UDim2.new(1, 0, 0, 45)
Title.TextColor3 = Color3.fromRGB(0, 255, 127) -- لون أخضر نيون
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1

UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 12)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- وظيفة إنشاء الأزرار
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Frame
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(0.85, 0, 0, 40)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

--- [ الأزرار الفعالة ] ---

-- 1. زر تسريع الإنتاج
createButton("⚙️ تسريع الإنتاج (0.1)", Color3.fromRGB(40, 40, 40), function()
    local count = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name == "ProductionSpeed" and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
            obj.Value = 0.1
            count = count + 1
        end
    end
    print("تم تسريع " .. count .. " مصانع!")
end)

-- 2. زر تسريع البناء
createButton("🏗️ بناء لحظي (0.1)", Color3.fromRGB(70, 20, 20), function()
    local count = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        -- مسميات محتملة لقيمة وقت البناء في الماب
        if (obj.Name == "BuildTime" or obj.Name == "BuildDelay" or obj.Name == "BuildSpeed") 
           and (obj:IsA("NumberValue") or obj:IsA("IntValue")) then
            obj.Value = 0.1
            count = count + 1
        end
    end
    print("تم تسريع " .. count .. " عمليات بناء!")
end)

print("Menu Loaded - Production & Build Speed Only.")
