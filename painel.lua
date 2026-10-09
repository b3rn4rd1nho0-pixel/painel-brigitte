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
    FundoPainel    = Color3.fromRGB(24, 24, 30),
    FundoBotao     = Color3.fromRGB(32, 32, 40),
    FundoBotaoHover= Color3.fromRGB(45, 45, 60),
    Header         = Color3.fromRGB(28, 28, 36),
    Dourado        = Color3.fromRGB(255, 200, 60),
    DouradoEscuro  = Color3.fromRGB(180, 140, 40),
    Verde          = Color3.fromRGB(60, 200, 100),
    Texto          = Color3.fromRGB(235, 235, 245),
    TextoSecundario= Color3.fromRGB(150, 150, 165),
    Borda          = Color3.fromRGB(45, 45, 58),
}

--// GUI BASE
local gui = Instance.new("ScreenGui")
gui.Name = "PainelBrigitte"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

--// BOTÃO PRINCIPAL (ícone flutuante)
local icon = Instance.new("TextButton")
icon.Name = "Icone"
icon.Size = UDim2.new(0, 64, 0, 64)
icon.Position = UDim2.new(0, 40, 0, 300)
icon.BackgroundColor3 = TEMA.Fundo
icon.Text = "🎖️"
icon.TextColor3 = TEMA.Dourado
icon.TextSize = 28
icon.Font = Enum.Font.GothamBold
icon.Parent = gui
icon.Active = true
icon.AutoButtonColor = false

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = icon

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = TEMA.Dourado
iconStroke.Thickness = 1.5
iconStroke.Transparency = 0.3
iconStroke.Parent = icon

local iconGradient = Instance.new("UIGradient")
iconGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, TEMA.Fundo),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 30, 20)),
})
iconGradient.Rotation = 135
iconGradient.Parent = icon

local iconGlow = Instance.new("ImageLabel")
iconGlow.Size = UDim2.new(1.8, 0, 1.8, 0)
iconGlow.Position = UDim2.new(-0.4, 0, -0.4, 0)
iconGlow.BackgroundTransparency = 1
iconGlow.Image = "rbxassetid://5028857084"
iconGlow.ImageColor3 = TEMA.Dourado
iconGlow.ImageTransparency = 0.6
iconGlow.ZIndex = 0
iconGlow.Parent = icon

--// PAINEL PRINCIPAL
local panel = Instance.new("Frame")
panel.Name = "Painel"
panel.Size = UDim2.new(0, 260, 0, 0)
panel.Position = UDim2.new(0, 40, 0, 370)
panel.BackgroundColor3 = TEMA.FundoPainel
panel.Visible = false
panel.ClipsDescendants = true
panel.Active = true
panel.Parent = gui

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 12)
panelCorner.Parent = panel

local panelStroke = Instance.new("UIStroke")
panelStroke.Color = TEMA.Borda
panelStroke.Thickness = 1
panelStroke.Parent = panel

local panelGradient = Instance.new("UIGradient")
panelGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 28, 36)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 18, 22)),
})
panelGradient.Rotation = 90
panelGradient.Parent = panel

--// HEADER
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 42)
header.BackgroundColor3 = TEMA.Header
header.BorderSizePixel = 0
header.Parent = panel

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local headerMask = Instance.new("Frame")
headerMask.Size = UDim2.new(1, 0, 0, 12)
headerMask.Position = UDim2.new(0, 0, 1, -12)
headerMask.BackgroundColor3 = TEMA.Header
headerMask.BorderSizePixel = 0
headerMask.Parent = header

local headerLine = Instance.new("Frame")
headerLine.Size = UDim2.new(1, 0, 0, 1)
headerLine.Position = UDim2.new(0, 0, 1, -1)
headerLine.BackgroundColor3 = TEMA.Dourado
headerLine.BorderSizePixel = 0
headerLine.Parent = header

local headerIcon = Instance.new("TextLabel")
headerIcon.Size = UDim2.new(0, 30, 1, 0)
headerIcon.Position = UDim2.new(0, 12, 0, 0)
headerIcon.BackgroundTransparency = 1
headerIcon.Text = "🎖️"
headerIcon.TextSize = 18
headerIcon.Font = Enum.Font.GothamBold
headerIcon.TextColor3 = TEMA.Dourado
headerIcon.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 42, 0, 0)
title.BackgroundTransparency = 1
title.Text = "BRIGITTE"
title.TextColor3 = TEMA.Dourado
title.TextSize = 15
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -100, 0, 12)
subtitle.Position = UDim2.new(0, 42, 0, 22)
subtitle.BackgroundTransparency = 1
subtitle.Text = "PAINEL DE COMANDOS"
subtitle.TextColor3 = TEMA.TextoSecundario
subtitle.TextSize = 9
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -32, 0.5, -12)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 30)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(220, 100, 100)
closeBtn.TextSize = 12
closeBtn.Font = Enum.Font.GothamBold
closeBtn.AutoButtonColor = false
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(180, 50, 50),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }):Play()
end)
closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = Color3.fromRGB(50, 30, 30),
        TextColor3 = Color3.fromRGB(220, 100, 100)
    }):Play()
end)

--// SCROLL FRAME
local scroll = Instance.new("ScrollingFrame")
scroll.Name = "Scroll"
scroll.Size = UDim2.new(1, -16, 0, 0)
scroll.Position = UDim2.new(0, 8, 0, 50)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = TEMA.Dourado
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarImageTransparency = 0.3
scroll.Parent = panel

local scrollLayout = Instance.new("UIListLayout")
scrollLayout.Padding = UDim.new(0, 6)
scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
scrollLayout.Parent = scroll

local scrollPadding = Instance.new("UIPadding")
scrollPadding.PaddingTop = UDim.new(0, 6)
scrollPadding.PaddingBottom = UDim.new(0, 6)
scrollPadding.Parent = scroll

--// LISTA DE COMANDOS
local comandos = {
    { texto = "M A T",        emoji = "💥", desc = "FATAL",              cor = Color3.fromRGB(220, 60, 60) },
    { texto = "Cortar Comunicação", emoji = "📡", desc = "Silenciar rádio", cor = Color3.fromRGB(80, 150, 220) },
    { texto = "Soco",         emoji = "👊", desc = "Golpe direto",       cor = Color3.fromRGB(230, 150, 60) },
    { texto = "JEB Esquerda", emoji = "🤚", desc = "Golpe lateral",      cor = Color3.fromRGB(230, 180, 60) },
    { texto = "Chute",        emoji = "🦵", desc = "Golpe baixo",        cor = Color3.fromRGB(230, 130, 60) },
    { texto = "Pegar",        emoji = "🫡", desc = "Rendição",           cor = Color3.fromRGB(100, 200, 130) },
    { texto = "Furar Pneu",   emoji = "💥", desc = "Sabotagem",          cor = Color3.fromRGB(200, 100, 80) },
    { texto = "Render",       emoji = "🔥", desc = "Pressão máxima",     cor = Color3.fromRGB(230, 90, 50) },
    { texto = "PD PERM",      emoji = "🇺🇸", desc = "Autorização",       cor = Color3.fromRGB(80, 130, 220) },
    { texto = "QRR°",         emoji = "🪖", desc = "Rádio",              cor = Color3.fromRGB(120, 180, 100) },
    { texto = "Matar",        emoji = "☠️", desc = "Ordem final",        cor = Color3.fromRGB(180, 50, 50) },
    { texto = "Cortar Rádio", emoji = "🚫", desc = "Comms off",          cor = Color3.fromRGB(200, 70, 70) },
}

--// FUNÇÃO CHAT
local function enviarChat(texto)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(texto)
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(texto, "All")
    end
end

local function montarMensagem(cmd)
    return string.format("%s // %s %s | %s", cmd.emoji, cmd.texto:upper(), cmd.emoji, cmd.desc)
end

--// GERADOR DE BOTÕES
for i, cmd in ipairs(comandos) do
    local btn = Instance.new("TextButton")
    btn.Name = "Cmd_" .. i
    btn.Size = UDim2.new(1, -8, 0, 46)
    btn.BackgroundColor3 = TEMA.FundoBotao
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.LayoutOrder = i
    btn.Parent = scroll

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = TEMA.Borda
    btnStroke.Thickness = 1
    btnStroke.Parent = btn

    local sideBar = Instance.new("Frame")
    sideBar.Size = UDim2.new(0, 3, 0.7, 0)
    sideBar.Position = UDim2.new(0, 0, 0.15, 0)
    sideBar.BackgroundColor3 = cmd.cor
    sideBar.BorderSizePixel = 0
    sideBar.Parent = btn

    local sideBarCorner = Instance.new("UICorner")
    sideBarCorner.CornerRadius = UDim.new(1, 0)
    sideBarCorner.Parent = sideBar

    local emojiLabel = Instance.new("TextLabel")
    emojiLabel.Size = UDim2.new(0, 34, 1, 0)
    emojiLabel.Position = UDim2.new(0, 10, 0, 0)
    emojiLabel.BackgroundTransparency = 1
    emojiLabel.Text = cmd.emoji
    emojiLabel.TextSize = 18
    emojiLabel.Font = Enum.Font.GothamBold
    emojiLabel.Parent = btn

    local nomeLabel = Instance.new("TextLabel")
    nomeLabel.Size = UDim2.new(1, -50, 0, 18)
    nomeLabel.Position = UDim2.new(0, 46, 0, 6)
    nomeLabel.BackgroundTransparency = 1
    nomeLabel.Text = cmd.texto
    nomeLabel.TextColor3 = TEMA.Texto
    nomeLabel.TextSize = 13
    nomeLabel.Font = Enum.Font.GothamBold
    nomeLabel.TextXAlignment = Enum.TextXAlignment.Left
    nomeLabel.Parent = btn

    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -50, 0, 12)
    descLabel.Position = UDim2.new(0, 46, 0, 24)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = cmd.desc
    descLabel.TextColor3 = TEMA.TextoSecundario
    descLabel.TextSize = 10
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = TEMA.FundoBotaoHover
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), {
            Color = cmd.cor
        }):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = TEMA.FundoBotao
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), {
            Color = TEMA.Borda
        }):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), {
            BackgroundColor3 = cmd.cor
        }):Play()
        task.delay(0.15, function()
            TweenService:Create(btn, TweenInfo.new(0.2), {
                BackgroundColor3 = TEMA.FundoBotao
            }):Play()
        end)
        enviarChat(montarMensagem(cmd))
    end)
end

-- Ajusta tamanho
local function atualizarTamanho()
    local total = scrollLayout.AbsoluteContentSize.Y + 12
    scroll.CanvasSize = UDim2.new(0, 0, 0, total)
    local alturaVisivel = math.min(total + 60, 480)
    panel.Size = UDim2.new(0, 260, 0, alturaVisivel)
    scroll.Size = UDim2.new(1, -16, 1, -60)
end

scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(atualizarTamanho)
atualizarTamanho()

--// SISTEMA DE ARRASTAR
local function tornarArrastavel(frame, handle)
    local arrastando = false
    local inicioMouse
    local inicioPos

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            arrastando = true
            inicioMouse = input.Position
            inicioPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    arrastando = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if arrastando and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - inicioMouse
            frame.Position = UDim2.new(
                inicioPos.X.Scale, inicioPos.X.Offset + delta.X,
                inicioPos.Y.Scale, inicioPos.Y.Offset + delta.Y
            )
        end
    end)
end

tornarArrastavel(panel, header)
tornarArrastavel(icon, icon)

--// ABRIR/FECHAR PAINEL
local aberto = false
local animando = false

local function abrirFechar()
    if animando then return end
    animando = true

    if not aberto then
        atualizarTamanho()
        local alturaFinal = panel.Size.Y.Offset

        panel.Position = UDim2.new(
            0, icon.Position.X.Offset + 74,
            0, icon.Position.Y.Offset
        )

        panel.Visible = true
        panel.Size = UDim2.new(0, 260, 0, 0)
        TweenService:Create(panel, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 260, 0, alturaFinal)
        }):Play()
        aberto = true
    else
        local tween = TweenService:Create(panel, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 260, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            panel.Visible = false
        end)
        aberto = false
    end

    task.wait(0.3)
    animando = false
end

icon.MouseButton1Click:Connect(function()
    abrirFechar()
end)

closeBtn.MouseButton1Click:Connect(function()
    abrirFechar()
end)

--// PÂNICO
local tempoApertado = 0
local segurando = false

icon.MouseButton1Down:Connect(function()
    segurando = true
    tempoApertado = tick()
end)

icon.MouseButton1Up:Connect(function()
    if segurando then
        segurando = false
        local duracao = tick() - tempoApertado
        if duracao >= 2 then
            gui:Destroy()
        end
    end
end)

--// ESP - BOLINHAS DE LOCALIZAÇÃO
local espFolder = Instance.new("Folder")
espFolder.Name = "BrigitteESP"
espFolder.Parent = gui

local bolinhas = {}

local function criarBolinha(plr)
    if plr == player then return end

    local function anexar(character)
        local hrp = character:WaitForChild("HumanoidRootPart", 5)
        if not hrp then return end

        if bolinhas[plr] and bolinhas[plr].Parent then
            bolinhas[plr]:Destroy()
        end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "BrigitteMarker"
        billboard.Size = UDim2.new(0, 18, 0, 18)
        billboard.AlwaysOnTop = true
        billboard.LightInfluence = 0
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.Adornee = hrp
        billboard.Parent = espFolder

        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(1, 0, 1, 0)
        dot.BackgroundColor3 = Color3.fromRGB(0, 255, 80)
        dot.BorderSizePixel = 0
        dot.Parent = billboard

        local dotCorner = Instance.new("UICorner")
        dotCorner.CornerRadius = UDim.new(1, 0)
        dotCorner.Parent = dot

        local dotStroke = Instance.new("UIStroke")
        dotStroke.Color = Color3.fromRGB(0, 0, 0)
        dotStroke.Thickness = 2
        dotStroke.Parent = dot

        local glow = Instance.new("ImageLabel")
        glow.Size = UDim2.new(2, 0, 2, 0)
        glow.Position = UDim2.new(-0.5, 0, -0.5, 0)
        glow.BackgroundTransparency = 1
        glow.Image = "rbxassetid://5028857084"
        glow.ImageColor3 = Color3.fromRGB(0, 255, 80)
        glow.ImageTransparency = 0.5
        glow.ZIndex = 0
        glow.Parent = dot

        bolinhas[plr] = billboard
    end

    if plr.Character then
        anexar(plr.Character)
    end

    plr.CharacterAdded:Connect(function(char)
        anexar(char)
    end)
end

for _, plr in ipairs(Players:GetPlayers()) do
    criarBolinha(plr)
end

Players.PlayerAdded:Connect(criarBolinha)

Players.PlayerRemoving:Connect(function(plr)
    if bolinhas[plr] and bolinhas[plr].Parent then
        bolinhas[plr]:Destroy()
    end
    bolinhas[plr] = nil
end)
