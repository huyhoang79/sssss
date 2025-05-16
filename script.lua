local boss = getgenv().name:lower()

local function tpTo(pos)
    local plyr = game.Players.LocalPlayer
    if plyr and plyr.Character and plyr.Character:FindFirstChild("HumanoidRootPart") then
        plyr.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end

if boss == "rip_indra" then
    print("🔄 Đang tìm boss Rip_Indra...")

    local bossModel = nil
    repeat
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("Model") and obj.Name == "Rip_Indra" and obj:FindFirstChild("Humanoid") then
                bossModel = obj
                break
            end
        end
        task.wait(2)
    until bossModel

    print("✅ Tìm thấy Rip_Indra!")
    tpTo(bossModel.HumanoidRootPart.Position + Vector3.new(0, 5, 0))

    while bossModel and bossModel:FindFirstChild("Humanoid") and bossModel.Humanoid.Health > 0 do
        task.wait(0.2)
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            tool:Activate()
        end
    end

    print("🏁 Boss đã bị tiêu diệt hoặc không tồn tại nữa.")
end
