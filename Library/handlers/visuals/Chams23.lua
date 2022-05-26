local ChamsVisuals = {
  ChamsTeamColors = false,
  ChamsEnabled = true,
  ChamsDepthMode = Enum.HighlightDepthMode.Occluded,
  ChamsFillColor = Color3.fromRGB(10, 10, 10),
  ChamsOutlineColor = Color3.fromRGB(85, 105, 230),
  ChamsFillTransparency = 0,
  ChamsOutlineTransparency = 0
}

function ChamsVisuals:EnableChams()
        spawn(function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
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
                    Highlight.Enabled = ChamsVisuals.ChamsEnabled
                    Highlight.DepthMode = ChamsVisuals.ChamsDepthMode
                    Highlight.FillColor = ChamsVisuals.ChamsFillColor
                    Highlight.OutlineColor = ChamsVisuals.ChamsOutlineColor
                    Highlight.FillTransparency = ChamsVisuals.ChamsFillTransparency
                    Highlight.OutlineTransparency = ChamsVisuals.ChamsOutlineTransparency
                    if getgenv().ChamsTeamColors == true then
                        Highlight.FillColor = v.TeamColor.Color
                    end
                end
            end
        end)
    end)
end

return ChamsVisuals
