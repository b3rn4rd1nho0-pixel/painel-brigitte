--// SERVIÇOS
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

--// TEMA
local TEMA = {
    Fundo          = Color3.fromRGB(18, 18, 22),
    FundoPainel    = Color3.fromRGB(24, 24, 30),
    FundoBotao     = Color3.fromRGB(32, 32, 40),
    FundoBotaoHover= Color3.fromRGB(45, 45, 60),
    Header         = Color3.fromRGB(28, 28, 36),
    Dourado        = Color3.fromRGB(255, 200, 60),
    Texto          = Color3.fromRGB(235, 235, 245),
    TextoSecundario= Color3.fromRGB(150, 150, 165),
    Borda          = Color3.fromRGB(45, 45, 58),
    Verde          = Color3.fromRGB(60, 200, 100),
    Vermelho       = Color3.fromRGB(220, 60, 60),
}

--// GUI BASE
local gui = Instance.new("ScreenGui")
gui.Name = "PainelBrigitte"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

--// ÍCONE PRINCIPAL
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

--// PAINEL
local panel = Instance.new("Frame")
panel.Name = "Painel"
panel.Size = UDim2.new(0, 280, 0, 0)
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
closeBtn.TextColor3 = TEMA.Vermelho
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
        TextColor3 = TEMA.Vermelho
    }):Play()
end)

--// BARRA DE ABAS
local tabsBar = Instance.new("Frame")
tabsBar.Name = "TabsBar"
tabsBar.Size = UDim2.new(1, -16, 0, 30)
tabsBar.Position = UDim2.new(0, 8, 0, 50)
tabsBar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
tabsBar.BorderSizePixel = 0
tabsBar.Parent = panel

local tabsBarCorner = Instance.new("UICorner")
tabsBarCorner.CornerRadius = UDim.new(0, 6)
tabsBarCorner.Parent = tabsBar

local tabsLayout = Instance.new("UIListLayout")
tabsLayout.FillDirection = Enum.FillDirection.Horizontal
tabsLayout.Padding = UDim.new(0, 4)
tabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
tabsLayout.Parent = tabsBar

--// CONTAINER DE CONTEÚDO (troca entre abas)
local contentFrame = Instance.new("Frame")
contentFrame.Name = "Content"
contentFrame.Size = UDim2.new(1, -16, 0, 0)
contentFrame.Position = UDim2.new(0, 8, 0, 88)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = panel

--// FUNÇÃO CHAT
local function enviarChat(texto)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(texto)
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(texto, "All")
    end
end

--// CONVERSOR NÚMERO → EXTENSO (1 a 100)
local extenso = {
    [1]="UM", [2]="DOIS", [3]="TRÊS", [4]="QUATRO", [5]="CINCO",
    [6]="SEIS", [7]="SETE", [8]="OITO", [9]="NOVE", [10]="DEZ",
    [11]="ONZE", [12]="DOZE", [13]="TREZE", [14]="CATORZE", [15]="QUINZE",
    [16]="DEZESSEIS", [17]="DEZESSETE", [18]="DEZOITO", [19]="DEZENOVE", [20]="VINTE",
    [30]="TRINTA", [40]="QUARENTA", [50]="CINQUENTA",
    [60]="SESSENTA", [70]="SETENTA", [80]="OITENTA", [90]="NOVENTA", [100]="CEM"
}

local function numeroParaExtenso(n)
    if extenso[n] then return extenso[n] end
    if n < 100 then
        local dezena = math.floor(n/10)*10
        local unidade = n - dezena
        return extenso[dezena] .. " E " .. extenso[unidade]
    end
    return tostring(n)
end

--// CRIAR ABA (botão de menu)
local abas = {}
local abasContainer = {}

local function criarAba(nome, emoji, ordem)
    -- Botão da aba
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = "Tab_" .. nome
    tabBtn.Size = UDim2.new(0, 82, 1, -6)
    tabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    tabBtn.Text = emoji .. " " .. nome
    tabBtn.TextColor3 = TEMA.TextoSecundario
    tabBtn.TextSize = 11
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.AutoButtonColor = false
    tabBtn.LayoutOrder = ordem
    tabBtn.Parent = tabsBar

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 5)
    tabCorner.Parent = tabBtn

    -- Container de conteúdo
    local container = Instance.new("ScrollingFrame")
    container.Name = "Container_" .. nome
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ScrollBarThickness = 4
    container.ScrollBarImageColor3 = TEMA.Dourado
    container.ScrollBarImageTransparency = 0.3
    container.CanvasSize = UDim2.new(0, 0, 0, 0)
    container.Visible = false
    container.Parent = contentFrame

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = container

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 6)
    padding.PaddingBottom = UDim.new(0, 6)
    padding.Parent = container

    abas[nome] = { botao = tabBtn, container = container, layout = layout }
    abasContainer[nome] = container

    -- Clique pra trocar aba
    tabBtn.MouseButton1Click:Connect(function()
        for _, dados in pairs(abas) do
            dados.container.Visible = false
            TweenService:Create(dados.botao, TweenInfo.new(0.15), {
                BackgroundColor3 = Color3.fromRGB(28, 28, 36),
                TextColor3 = TEMA.TextoSecundario
            }):Play()
        end
        container.Visible = true
        TweenService:Create(tabBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = TEMA.Dourado,
            TextColor3 = Color3.fromRGB(20, 20, 20)
        }):Play()
        atualizarTamanho()
    end)

    return container
end

--// CRIAR BOTÃO DE COMANDO (card)
local function criarCard(parent, cmd, layoutOrder)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -8, 0, 44)
    btn.BackgroundColor3 = TEMA.FundoBotao
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.LayoutOrder = layoutOrder
    btn.Parent = parent

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
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = cmd.cor }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = TEMA.FundoBotao
        }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = TEMA.Borda }):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), { BackgroundColor3 = cmd.cor }):Play()
        task.delay(0.15, function()
            TweenService:Create(btn, TweenInfo.new(0.2), { BackgroundColor3 = TEMA.FundoBotao }):Play()
        end)
        enviarChat(cmd.mensagem or (cmd.emoji .. " // " .. cmd.texto:upper() .. " " .. cmd.emoji .. " | " .. cmd.desc))
    end)

    return btn
end

--// CRIAR INPUT (caixa de texto)
local function criarInput(parent, placeholder, ordem)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, -8, 0, 38)
    box.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    box.BorderSizePixel = 0
    box.LayoutOrder = ordem
    box.Parent = parent

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 6)
    boxCorner.Parent = box

    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = TEMA.Borda
    boxStroke.Thickness = 1
    boxStroke.Parent = box

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -12, 1, 0)
    input.Position = UDim2.new(0, 6, 0, 0)
    input.BackgroundTransparency = 1
    input.Text = ""
    input.PlaceholderText = placeholder
    input.PlaceholderColor3 = TEMA.TextoSecundario
    input.TextColor3 = TEMA.Texto
    input.TextSize = 13
    input.Font = Enum.Font.Gotham
    input.TextXAlignment = Enum.TextXAlignment.Left
    input.ClearTextOnFocus = false
    input.Parent = box

    input.Focused:Connect(function()
        TweenService:Create(boxStroke, TweenInfo.new(0.15), { Color = TEMA.Dourado }):Play()
    end)
    input.FocusLost:Connect(function()
        TweenService:Create(boxStroke, TweenInfo.new(0.15), { Color = TEMA.Borda }):Play()
    end)

    return input
end

--// CRIAR LABEL
local function criarLabel(parent, texto, cor, ordem, tamanho)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -8, 0, tamanho or 20)
    lbl.BackgroundTransparency = 1
    lbl.Text = texto
    lbl.TextColor3 = cor or TEMA.Dourado
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = ordem
    lbl.Parent = parent
    return lbl
end

--==========================================
--// ABA 1 — COMANDOS
--==========================================
local abaComandos = criarAba("COMANDOS", "⚔️", 1)

local comandos = {
    { texto = "M A T",              emoji = "💥", desc = "FATAL",           cor = Color3.fromRGB(220, 60, 60) },
    { texto = "Cortar Comunicação", emoji = "📡", desc = "Silenciar rádio", cor = Color3.fromRGB(80, 150, 220) },
    { texto = "Soco",               emoji = "👊", desc = "Golpe direto",    cor = Color3.fromRGB(230, 150, 60) },
    { texto = "JEB Esquerda",       emoji = "🤚", desc = "Golpe lateral",   cor = Color3.fromRGB(230, 180, 60) },
    { texto = "Chute",              emoji = "🦵", desc = "Golpe baixo",     cor = Color3.fromRGB(230, 130, 60) },
    { texto = "Pegar",              emoji = "🫡", desc = "Rendição",        cor = Color3.fromRGB(100, 200, 130) },
    { texto = "Furar Pneu",         emoji = "💥", desc = "Sabotagem",       cor = Color3.fromRGB(200, 100, 80) },
    { texto = "Render",             emoji = "🔥", desc = "Pressão máxima",  cor = Color3.fromRGB(230, 90, 50) },
    { texto = "PD PERM",            emoji = "🇺🇸", desc = "Autorização",    cor = Color3.fromRGB(80, 130, 220) },
    { texto = "QRR°",               emoji = "🪖", desc = "Rádio",           cor = Color3.fromRGB(120, 180, 100) },
    { texto = "Matar",              emoji = "☠️", desc = "Ordem final",     cor = Color3.fromRGB(180, 50, 50) },
    { texto = "Cortar Rádio",       emoji = "🚫", desc = "Comms off",       cor = Color3.fromRGB(200, 70, 70) },
}

for i, cmd in ipairs(comandos) do
    criarCard(abaComandos, cmd, i)
end

--==========================================
--// ABA 2 — JJ's
--==========================================
local abaJJ = criarAba("JJ's", "🏋️", 2)

criarLabel(abaJJ, "🏋️ SISTEMA DE JJ's", TEMA.Dourado, 1, 22)
criarLabel(abaJJ, "Digite o número inicial e final", TEMA.TextoSecundario, 2, 16)

local inputInicio = criarInput(abaJJ, "De (ex: 1)", 3)
local inputFim    = criarInput(abaJJ, "Até (ex: 10)", 4)

-- Botão START
local btnStart = Instance.new("TextButton")
btnStart.Size = UDim2.new(1, -8, 0, 42)
btnStart.BackgroundColor3 = TEMA.Verde
btnStart.Text = "▶ INICIAR CONTAGEM"
btnStart.TextColor3 = Color3.fromRGB(255, 255, 255)
btnStart.TextSize = 13
btnStart.Font = Enum.Font.GothamBold
btnStart.AutoButtonColor = false
btnStart.LayoutOrder = 5
btnStart.Parent = abaJJ

local btnStartCorner = Instance.new("UICorner")
btnStartCorner.CornerRadius = UDim.new(0, 8)
btnStartCorner.Parent = btnStart

-- Botão STOP
local btnStop = Instance.new("TextButton")
btnStop.Size = UDim2.new(1, -8, 0, 36)
btnStop.BackgroundColor3 = TEMA.Vermelho
btnStop.Text = "⏹ PARAR"
btnStop.TextColor3 = Color3.fromRGB(255, 255, 255)
btnStop.TextSize = 12
btnStop.Font = Enum.Font.GothamBold
btnStop.AutoButtonColor = false
btnStop.LayoutOrder = 6
btnStop.Parent = abaJJ

local btnStopCorner = Instance.new("UICorner")
btnStopCorner.CornerRadius = UDim.new(0, 8)
btnStopCorner.Parent = btnStop

-- Label de status
local lblStatus = criarLabel(abaJJ, "Status: aguardando...", TEMA.TextoSecundario, 7, 16)

-- Controle da contagem
local contagemAtiva = false
local contagemToken = 0

local function pularPersonagem()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if hum:GetState() == Enum.HumanoidStateType.Seated then return end
    hum.Jump = true
end

btnStart.MouseButton1Click:Connect(function()
    local n1 = tonumber(inputInicio.Text)
    local n2 = tonumber(inputFim.Text)

    if not n1 or not n2 then
        lblStatus.Text = "❌ Digite números válidos!"
        lblStatus.TextColor3 = TEMA.Vermelho
        return
    end
    if n1 > n2 then
        lblStatus.Text = "❌ O inicial deve ser menor que o final!"
        lblStatus.TextColor3 = TEMA.Vermelho
        return
    end
    if n1 < 1 or n2 > 100 then
        lblStatus.Text = "❌ Use números de 1 a 100!"
        lblStatus.TextColor3 = TEMA.Vermelho
        return
    end

    contagemAtiva = true
    contagemToken = contagemToken + 1
    local meuToken = contagemToken

    lblStatus.Text = "✅ Contando de " .. n1 .. " até " .. n2 .. "..."
    lblStatus.TextColor3 = TEMA.Verde

    task.spawn(function()
        for i = n1, n2 do
            if not contagemAtiva or contagemToken ~= meuToken then
                break
            end

            local palavra = numeroParaExtenso(i) .. "!"
            enviarChat(palavra)
            pularPersonagem()

            task.wait(1)
        end

        if contagemToken == meuToken then
            contagemAtiva = false
            lblStatus.Text = "✅ Contagem finalizada!"
            lblStatus.TextColor3 = TEMA.Verde
        end
    end)
end)

btnStop.MouseButton1Click:Connect(function()
    contagemAtiva = false
    contagemToken = contagemToken + 1
    lblStatus.Text = "⏹ Contagem parada."
    lblStatus.TextColor3 = TEMA.Vermelho
end)

--==========================================
--// ABA
