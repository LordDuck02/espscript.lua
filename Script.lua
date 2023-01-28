local players = {}
local chams = {}
local UIS = game:GetService('UserInputService')
local espEnabled = true

function give_esp(plr)
  local cham = Instance.new("Highlight", game:GetService("CoreGui"))
  cham.Enabled = espEnabled
  cham.OutlineTransparency = 0
  cham.OutlineColor = Color3.fromRGB(3,33,46)
  cham.Adornee = plr.Character
  cham.FillColor = Color3.fromRGB(100,3,5)
  cham.FillTransparency = 0
  table.insert(chams, cham)
end

function remove_esp(plr)
    for i, player in pairs(players) do
        if player == plr then
            chams[i]:Destroy()
            table.remove(players, i)
            table.remove(chams, i)
            break
        end
    end
end

for _, v in pairs(game:GetService("Players"):GetPlayers()) do
     table.insert(players, v)
     give_esp(v)
end

game:GetService('Players').PlayerAdded:Connect(function(plr)
    table.insert(players, plr)
    give_esp(plr)
end)

game:GetService('Players').PlayerRemoving:Connect(function(plr)
    remove_esp(plr)
end)

function toggle_esp()
    espEnabled = not espEnabled
    for _,cham in pairs(chams) do
        cham.Enabled = espEnabled
    end
end

UIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.F then
      toggle_esp()
    end
end)
