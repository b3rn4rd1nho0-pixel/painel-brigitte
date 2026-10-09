# painel-brigitte
--// SERVIÇOS
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

--// CONFIGURAÇÕES DE CORES (TEMA PROFISSIONAL)
local TEMA = {
    Fundo          = Color3.fromRGB(18, 18, 22),
    ...
  Players.PlayerRemoving:Connect(function(plr)
    if bolinhas[plr] and bolinhas[plr].Parent then
        bolinhas[plr]:Destroy()
    end
    bolinhas[plr] = nil
end)
