local ChamsVisuals = {
getgenv().ChamsTeamColors = false,
getgenv().ChamsEnabled = true,
getgenv().ChamsDepthMode = Enum.HighlightDepthMode.Occluded, -- Enum.HighlightDepthMode.Occluded to make it visible only
getgenv().ChamsFillColor = Color3.fromRGB(10, 10, 10),
getgenv().ChamsOutlineColor = Color3.fromRGB(85, 105, 230),
getgenv().ChamsFillTransparency = 0,
getgenv().ChamsOutlineTransparency = 0,
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

function ChamsVisuals:EnableChams()
local function CreateHighlight(Player)
   if (not Player.Character:FindFirstChild("HighlightCham") and Player ~= Players.LocalPlayer) then
       local Highlight = Instance.new("Highlight", Player.Character)
       Highlight.Name = "HighlightCham"
   end
end

RunService.Stepped:Connect(function()
    for i,v in next, Players:GetPlayers() do
        CreateHighlight(v)
        if (v.Character:FindFirstChild("HighlightCham")) then
            local Highlight = v.Character.HighlightCham
            Highlight.Enabled = getgenv().ChamsEnabled
            Highlight.DepthMode = getgenv().ChamsDepthMode
            Highlight.FillColor = getgenv().ChamsFillColor
            Highlight.OutlineColor = getgenv().ChamsOutlineColor
            Highlight.FillTransparency = getgenv().ChamsFillTransparency
            Highlight.OutlineTransparency = getgenv().ChamsOutlineTransparency
            if getgenv().ChamsTeamColors == true then
                Highlight.FillColor = v.TeamColor.Color
            end
        end
    end
end)
end

return ChamsVisuals
