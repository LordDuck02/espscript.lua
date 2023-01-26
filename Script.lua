local players = {}
local chams = {}

function give_esp(plr)
  local cham = Instance.new("Highlight", game:GetService("CoreGui"))
  table.insert(chams, cham)
  
  game:GetService("RunService").Stepped:Connect(function()
        cham.Enabled = true
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


function remove_esp()
    for _,cham in pairs(chams) do
        cham:Destroy()
    end
    chams = {}
end

-- keybind thingy, rember for future scripps
game:GetService("ContextActionService"):BindAction("remove_esp", remove_esp, false, Enum.KeyCode.Z)
