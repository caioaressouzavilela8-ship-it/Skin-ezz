-- Coloque esse script em um LocalScript na StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textBox = Instance.new("TextBox")
local submitButton = Instance.new("TextButton")

-- Configurações do painel
frame.Size = UDim2.new(0.3, 0, 0.2, 0)
frame.Position = UDim2.new(0.35, 0, 0.4, 0)
frame.Visible = false
frame.Parent = gui

frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 2

textBox.Size = UDim2.new(0.8, 0, 0.4, 0)
textBox.Position = UDim2.new(0.1, 0, 0.1, 0)
textBox.PlaceholderText = "Digite o nick da pessoa"
textBox.Parent = frame

submitButton.Size = UDim2.new(0.6, 0, 0.3, 0)
submitButton.Position = UDim2.new(0.2, 0, 0.6, 0)
submitButton.Text = "Copiar Skin"
submitButton.Parent = frame

gui.Parent = player:WaitForChild("PlayerGui")

-- Função para copiar a skin do jogador alvo
local function copySkin(targetName)
    local targetPlayer = Players:FindFirstChild(targetName)
    if targetPlayer and targetPlayer.Character and player.Character then
        for _, part in pairs(targetPlayer.Character:GetChildren()) do
            if part:IsA("MeshPart") or part:IsA("Accessory") then
                local clone = part:Clone()
                clone.Parent = player.Character
            end
        end
        print("Skin copiada de " .. targetName)
    else
        print("Jogador não encontrado ou personagem inválido.")
    end
end

-- Mostrar o painel ao digitar "/skin" no chat
player.Chatted:Connect(function(message)
    if message:lower() == "/skin" then
        frame.Visible = not frame.Visible
    end
end)

-- Conectar o botão ao evento
submitButton.MouseButton1Click:Connect(function()
    local targetName = textBox.Text
    if targetName and targetName ~= "" then
        copySkin(targetName)
        frame.Visible = false
    end
end)