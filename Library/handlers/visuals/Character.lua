local CharacterVisuals = {}

function CharacterVisuals:MovementTrail()
        spawn(function()
            local root = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            local trail = Instance.new("Trail")
            local cam = workspace.CurrentCamera
            breadcrumbattachment = Instance.new("Attachment")
            breadcrumbattachment.Position = Vector3.new(0, 0.07 - 2.9, 0.5)
            breadcrumbattachment2 = Instance.new("Attachment")
            breadcrumbattachment2.Position = Vector3.new(0, -0.07 - 2.9, 0.5)
            breadcrumbattachment.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            breadcrumbattachment2.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                for k, v in pairs(
                    {
                        Lifetime = 3,
                        Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0, 0, 1)),
                        MinLength = 0,
                        FaceCamera = true,
                        Enabled = true,
                        Attachment0 = breadcrumbattachment,
                        Attachment1 = breadcrumbattachment2,
                        Parent = cam
                    }
                ) do
            trail[k] = v
        end
    end)
end

function CharacterVisuals:DisableMovementTrail()
    local root = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    local trail = Instance.new("Trail")
    local cam = workspace.CurrentCamera
            
    for i, v in pairs(cam:GetDescendants()) do
        if v.Name == 'Trail' then
            v:Destroy()
        end
    end
    for i, v in pairs(root:GetDescendants()) do
        if v.Name == 'Attachment' then
            v:Destroy()
        end
    end
end

return CharacterVisuals
