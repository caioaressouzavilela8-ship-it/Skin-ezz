-- Coloque esse script em um LocalScript na StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local layout = Instance.new("UIGridLayout")
local skins = {"Skin1", "Skin2", "Skin3"} -- Substitua pelos nomes/IDs das skins reais.

-- Função para aplicar a skin localmente
local function applySkin(skinName)
    print("Skin aplicada: " .. skinName)
    -- Adicione aqui o código para realmente trocar a skin do jogador.
end

-- Configurações do painel
frame.Size = UDim2.new(0.4, 0, 0.4, 0)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.Visible = false
frame.Parent = gui

layout.Parent = frame
layout.CellSize = UDim2.new(0.3, 0, 0.3, 0)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder

gui.Parent = player:WaitForChild("PlayerGui")
-- Gerar botões para escolher skins
for _, skin in pairs(skins) do
    local button = Instance.new("TextButton")
    button.Text = skin
    button.Size = UDim2.new(0, 100, 0, 50)
    button.MouseButton1Click:Connect(function()
        applySkin(skin)
        frame.Visible = false
    end)
    button.Parent = frame
end

-- Mostrar o painel ao digitar "/Skin" no chat
player.Chatted:Connect(function(message)
    if message:lower() == "/skin" then
        frame.Visible = not frame.Visible
    end
end)