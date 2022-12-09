_G.Config = { ["Theme"] = "discord" }
local Nord = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/scripterhub/NORDLib/main/NordNotifs.lua", true))();
Nord:Notify(".gg/Y8ghpBZyYT", "HOLD 'V' TO USE ANTILOCK", "warn", 3);


local UserInputService = game:GetService("UserInputService")

local function onInputBegan(input, _gameProcessed)
    if input.KeyCode == Enum.KeyCode.V then
        getgenv().antilock = true
        Nord:Notify(".gg/Y8ghpBZyYT", "ANTILOCK [ON]", "success", 1.5);
    end
end

local function onInputEnded(input, _gameProcessed)
    if input.KeyCode == Enum.KeyCode.V then
        getgenv().antilock = false
        Nord:Notify(".gg/Y8ghpBZyYT", "ANTILOCK [OFF]", "error", 1.5);
    end
end

UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputEnded:Connect(onInputEnded)

game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().antilock == true then 
    local dog = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-75,0) 
    game:GetService("RunService").RenderStepped:Wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = dog 
    end 
end) 
