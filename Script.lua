local players = {}
local chams = {}
local espEnabled = true

game:GetService("Players").PlayerAdded:Connect(function(plr)
  local cham = Instance.new("Highlight", game:GetService("CoreGui"))
  table.insert(chams, cham)
  cham.Enabled = espEnabled
  cham.OutlineTransparency = 0
  cham.OutlineColor = Color3.fromRGB(3,33,46)
  cham.Adornee = plr.Character
  cham.FillColor = Color3.fromRGB(100,3,5)
  cham.FillTransparency = 0
  table.insert(players, plr)
end)

game:GetService("Players").PlayerRemoving:Connect(function(plr)
  local cham = table.remove(chams, plr)
  cham:Destroy()
  table.remove(players, plr)
end)

function toggle_esp()
    espEnabled = not espEnabled
    for _, cham in pairs(chams) do
        cham.Enabled = espEnabled
    end
end

game:GetService("ContextActionService"):BindAction("toggle_esp", toggle_esp, true, Enum.KeyCode.Z)
