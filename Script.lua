local players = {}
local chams = {}
local UIS = game:GetService('UserInputService')
local espEnabled = true

function give_esp(plr)
  local cham = Instance.new("Highlight", game:GetService("CoreGui"))
  table.insert(chams, cham)
  
  game:GetService("RunService").Stepped:Connect(function()
        cham.Enabled = espEnabled
        cham.OutlineTransparency = 0
        cham.OutlineColor = Color3.fromRGB(3,33,46)
        cham.Adornee = plr.Character
        cham.FillColor = Color3.fromRGB(100,3,5)
        cham.FillTransparency = 0
   end)
end

for _, v in pairs(game:GetService("Players"):GetPlayers()) do
     table.insert(players, v)
     give_esp(v)
end

game:GetService('Players').PlayerAdded:connect(function(v)
table.insert(players, v)
give_esp(v)
end)

game:GetService('Players').PlayerRemoving:connect(function(v)
table.remove(players, v)
end)

-- if you're reading this, u can change 'F' to any letter u want to (must be caps)
UIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.F then
      espEnabled = not espEnabled
      for _,cham in pairs(chams) do
        cham.Enabled = espEnabled
        end
end)
