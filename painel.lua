--// SERVIÇOS
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
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

--// ÍCONE PRINCIPAL (Mini)
local icon = Instance.new("TextButton")
icon.Name = "Icone"
icon.Size = UDim2.new(0, 35, 0, 35)
icon.Position = UDim2.new(0, 10, 0, 100)
icon.BackgroundColor3 = TEMA.Fundo
icon.Text = "🎖️"
icon.TextColor3 = TEMA.Dourado
icon.TextSize = 16
icon.Font = Enum.Font.GothamBold
icon.Parent = gui
icon.Active = true
icon.AutoButtonColor = false

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = icon

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = TEMA.Dourado
iconStroke.Thickness = 1
iconStroke.Parent = icon

--// PAINEL (Super Compacto - 140 de largura)
local panel = Instance.new("Frame")
panel.Name = "Painel"
panel.Size = UDim2.new(0, 140, 0, 0)
panel.Position = UDim2.new(0, 10, 0, 140)
panel.BackgroundColor3 = TEMA.FundoPainel
panel.Visible = false
panel.ClipsDescendants = true
panel.Active = true
panel.Parent = gui

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 8)
panelCorner.Parent = panel

local panelStroke = Instance.new("UIStroke")
panelStroke.Color = TEMA.Borda
panelStroke.Thickness = 1
panelStroke.Parent = panel

--// HEADER (Fino)
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 24)
header.BackgroundColor3 = TEMA.Header
header.BorderSizePixel = 0
header.Parent = panel

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 8)
headerCorner.Parent = header

local headerMask = Instance.new("Frame")
headerMask.Size = UDim2.new(1, 0, 0, 8)
headerMask.Position = UDim2.new(0, 0, 1, -8)
headerMask.BackgroundColor3 = TEMA.Header
headerMask.BorderSizePixel = 0
headerMask.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 1, 0)
title.Position = UDim2.new(0, 6, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🎖️ BRIGITTE"
title.TextColor3 = TEMA.Dourado
title.TextSize = 10
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 16, 0, 16)
closeBtn.Position = UDim2.new(1, -20, 0.5, -8)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 30, 30)
closeBtn.Text = "✕"
closeBtn.TextColor3 = TEMA.Vermelho
closeBtn.TextSize = 8
closeBtn.Font = Enum.Font.GothamBold
closeBtn.AutoButtonColor = false
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeBtn

--// BARRA DE ABAS (Micro)
local tabsBar = Instance.new("Frame")
tabsBar.Size = UDim2.new(1, -8, 0, 18)
tabsBar.Position = UDim2.new(0, 4, 0, 28)
tabsBar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
tabsBar.BorderSizePixel = 0
tabsBar.Parent = panel

local tabsBarCorner = Instance.new("UICorner")
tabsBarCorner.CornerRadius = UDim.new(0, 4)
tabsBarCorner.Parent = tabsBar

local tabsLayout = Instance.new("UIListLayout")
tabsLayout.FillDirection = Enum.FillDirection.Horizontal
tabsLayout.Padding = UDim.new(0, 2)
tabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
tabsLayout.Parent = tabsBar

--// CONTAINER DE CONTEÚDO
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -8, 0, 0)
contentFrame.Position = UDim2.new(0, 4, 0, 50)
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

local abas = {}
local function criarAba(nome, emoji, ordem)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(0, 42, 1, -2)
    tabBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    tabBtn.Text = emoji
    tabBtn.TextColor3 = TEMA.TextoSecundario
    tabBtn.TextSize = 10
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.AutoButtonColor = false
    tabBtn.LayoutOrder = ordem
    tabBtn.Parent = tabsBar

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 3)
    tabCorner.Parent = tabBtn

    local container = Instance.new("ScrollingFrame")
    container.Size = UDim2.new(1, 0, 1, 0)
    container.BackgroundTransparency = 1
    container.BorderSizePixel = 0
    container.ScrollBarThickness = 2
    container.ScrollBarImageColor3 = TEMA.Dourado
    container.CanvasSize = UDim2.new(0, 0, 0, 0)
    container.Visible = false
    container.Parent = contentFrame

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 3)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = container

    abas[nome] = { botao = tabBtn, container = container, layout = layout }

    tabBtn.MouseButton1Click:Connect(function()
        for _, dados in pairs(abas) do
            dados.container.Visible = false
            TweenService:Create(dados.botao, TweenInfo.new(0.1), { BackgroundColor3 = Color3.fromRGB(28, 28, 36), TextColor3 = TEMA.TextoSecundario }):Play()
        end
        container.Visible = true
        TweenService:Create(tabBtn, TweenInfo.new(0.1), { BackgroundColor3 = TEMA.Dourado, TextColor3 = Color3.fromRGB(20, 20, 20) }):Play()
        atualizarTamanho()
    end)
    return container
end

--// CONVERSOR NÚMERO → EXTENSO
local unidades = { [1]="UM", [2]="DOIS", [3]="TRÊS", [4]="QUATRO", [5]="CINCO", [6]="SEIS", [7]="SETE", [8]="OITO", [9]="NOVE" }
local especiais = { [10]="DEZ", [11]="ONZE", [12]="DOZE", [13]="TREZE", [14]="CATORZE", [15]="QUINZE", [16]="DEZESSEIS", [17]="DEZESSETE", [18]="DEZOITO", [19]="DEZENOVE" }
local dezenas = { [2]="VINTE", [3]="TRINTA", [4]="QUARENTA", [5]="CINQUENTA", [6]="SESSENTA", [7]="SETENTA", [8]="OITENTA", [9]="NOVENTA" }
local centenas = { [1]="CENTO", [2]="DUZENTOS", [3]="TREZENTOS", [4]="QUATROCENTOS", [5]="QUINHENTOS", [6]="SEISCENTOS", [7]="SETECENTOS", [8]="OITOCENTOS", [9]="NOVECENTOS" }

local function numeroParaExtenso(n)
    if n < 1 or n > 1000 then return tostring(n) end
    if n == 100 then return "CEM" end
    if n == 1000 then return "MIL" end
    local partes = {}
    local c = math.floor(n / 100)
    local resto = n % 100
    if c > 0 then table.insert(partes, centenas[c]) end
    if resto >= 10 and resto <= 19 then table.insert(partes, especiais[resto])
    elseif resto >= 20 then
        local d = math.floor(resto / 10)
        local u = resto % 10
        if u > 0 then table.insert(partes, dezenas[d] .. " E " .. unidades[u]) else table.insert(partes, dezenas[d]) end
    elseif resto >= 1 and resto <= 9 then table.insert(partes, unidades[resto]) end
    return table.concat(partes, " E ")
end
--// CRIA BOTÕES E INPUTS
local function criarCard(parent, cmd, layoutOrder)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 26)
    btn.BackgroundColor3 = TEMA.FundoBotao
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.LayoutOrder = layoutOrder
    btn.Parent = parent

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = TEMA.Borda
    btnStroke.Thickness = 1
    btnStroke.Parent = btn

    local emojiLabel = Instance.new("TextLabel")
    emojiLabel.Size = UDim2.new(0, 20, 1, 0)
    emojiLabel.Position = UDim2.new(0, 2, 0, 0)
    emojiLabel.BackgroundTransparency = 1
    emojiLabel.Text = cmd.emoji
    emojiLabel.TextSize = 12
    emojiLabel.Parent = btn

    local nomeLabel = Instance.new("TextLabel")
    nomeLabel.Size = UDim2.new(1, -25, 0, 12)
    nomeLabel.Position = UDim2.new(0, 24, 0, 2)
    nomeLabel.BackgroundTransparency = 1
    nomeLabel.Text = cmd.texto
    nomeLabel.TextColor3 = TEMA.Texto
    nomeLabel.TextSize = 9
    nomeLabel.Font = Enum.Font.GothamBold
    nomeLabel.TextXAlignment = Enum.TextXAlignment.Left
    nomeLabel.Parent = btn

    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -25, 0, 10)
    descLabel.Position = UDim2.new(0, 24, 0, 13)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = cmd.desc
    descLabel.TextColor3 = TEMA.TextoSecundario
    descLabel.TextSize = 8
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.Parent = btn

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), { BackgroundColor3 = TEMA.FundoBotaoHover }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.1), { Color = cmd.cor }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), { BackgroundColor3 = TEMA.FundoBotao }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.1), { Color = TEMA.Borda }):Play()
    end)
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), { BackgroundColor3 = cmd.cor }):Play()
        task.delay(0.1, function() TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = TEMA.FundoBotao }):Play() end)
        enviarChat(cmd.emoji .. " // " .. cmd.texto:upper() .. " " .. cmd.emoji .. " | " .. cmd.desc)
    end)
    return btn
end

local function criarInput(parent, placeholder, ordem)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(1, 0, 0, 22)
    box.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    box.BorderSizePixel = 0
    box.LayoutOrder = ordem
    box.Parent = parent
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 4)
    boxCorner.Parent = box
    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = TEMA.Borda
    boxStroke.Thickness = 1
    boxStroke.Parent = box
    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1, -6, 1, 0)
    input.Position = UDim2.new(0, 3, 0, 0)
    input.BackgroundTransparency = 1
    input.Text = ""
    input.PlaceholderText = placeholder
    input.PlaceholderColor3 = TEMA.TextoSecundario
    input.TextColor3 = TEMA.Texto
    input.TextSize = 9
    input.Font = Enum.Font.Gotham
    input.TextXAlignment = Enum.TextXAlignment.Left
    input.ClearTextOnFocus = false
    input.Parent = box
    input.Focused:Connect(function() TweenService:Create(boxStroke, TweenInfo.new(0.1), { Color = TEMA.Dourado }):Play() end)
    input.FocusLost:Connect(function() TweenService:Create(boxStroke, TweenInfo.new(0.1), { Color = TEMA.Borda }):Play() end)
    return input
end

--// ABA 1 — COMANDOS
local abaComandos = criarAba("COMANDOS", "⚔️", 1)
local comandos = {
    { texto = "M A T", emoji = "💥", desc = "FATAL", cor = Color3.fromRGB(220, 60, 60) },
    { texto = "Cortar Com.", emoji = "📡", desc = "Rádio off", cor = Color3.fromRGB(80, 150, 220) },
    { texto = "Soco", emoji = "👊", desc = "Golpe", cor = Color3.fromRGB(230, 150, 60) },
    { texto = "JEB Esq.", emoji = "🤚", desc = "Golpe", cor = Color3.fromRGB(230, 180, 60) },
    { texto = "Chute", emoji = "🦵", desc = "Golpe", cor = Color3.fromRGB(230, 130, 60) },
    { texto = "Pegar", emoji = "🫡", desc = "Rendição", cor = Color3.fromRGB(100, 200, 130) },
    { texto = "Furar Pneu", emoji = "💥", desc = "Sabotagem", cor = Color3.fromRGB(200, 100, 80) },
    { texto = "Render", emoji = "🔥", desc = "Pressão", cor = Color3.fromRGB(230, 90, 50) },
    { texto = "PD PERM", emoji = "🇺🇸", desc = "Autorização", cor = Color3.fromRGB(80, 130, 220) },
    { texto = "QRR°", emoji = "🪖", desc = "Rádio", cor = Color3.fromRGB(120, 180, 100) },
    { texto = "Matar", emoji = "☠️", desc = "Ordem final", cor = Color3.fromRGB(180, 50, 50) },
    { texto = "Cortar Rádio", emoji = "🚫", desc = "Comms off", cor = Color3.fromRGB(200, 70, 70) },
}
for i, cmd in ipairs(comandos) do criarCard(abaComandos, cmd, i) end

--// ABA 2 — JJ's
local abaJJ = criarAba("JJ's", "🏋️", 2)
local inputInicio = criarInput(abaJJ, "De (ex: 1)", 1)
local inputFim    = criarInput(abaJJ, "Até (ex: 10)", 2)

local btnStart = Instance.new("TextButton")
btnStart.Size = UDim2.new(1, 0, 0, 24)
btnStart.BackgroundColor3 = TEMA.Verde
btnStart.Text = "▶ INICIAR"
btnStart.TextColor3 = Color3.fromRGB(255, 255, 255)
btnStart.TextSize = 9
btnStart.Font = Enum.Font.GothamBold
btnStart.AutoButtonColor = false
btnStart.LayoutOrder = 3
btnStart.Parent = abaJJ
local btnStartCorner = Instance.new("UICorner")
btnStartCorner.CornerRadius = UDim.new(0, 4)
btnStartCorner.Parent = btnStart

local btnStop = Instance.new("TextButton")
btnStop.Size = UDim2.new(1, 0, 0, 20)
btnStop.BackgroundColor3 = TEMA.Vermelho
btnStop.Text = "⏹ PARAR"
btnStop.TextColor3 = Color3.fromRGB(255, 255, 255)
btnStop.TextSize = 9
btnStop.Font = Enum.Font.GothamBold
btnStop.AutoButtonColor = false
btnStop.LayoutOrder = 4
btnStop.Parent = abaJJ
local btnStopCorner = Instance.new("UICorner")
btnStopCorner.CornerRadius = UDim.new(0, 4)
btnStopCorner.Parent = btnStop

local lblStatus = Instance.new("TextLabel")
lblStatus.Size = UDim2.new(1, 0, 0, 14)
lblStatus.BackgroundTransparency = 1
lblStatus.Text = "Aguardando..."
lblStatus.TextColor3 = TEMA.TextoSecundario
lblStatus.TextSize = 8
lblStatus.Font = Enum.Font.Gotham
lblStatus.LayoutOrder = 5
lblStatus.Parent = abaJJ

local contagemAtiva = false
local contagemToken = 0
local function pularPersonagem()
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if hum:GetState() == Enum.HumanoidStateType.Seated or hum:GetState() == Enum.HumanoidStateType.Dead then return end
    hum:ChangeState(Enum.HumanoidStateType.Jumping)
    hum.Jump = true
end

btnStart.MouseButton1Click:Connect(function()
    local n1, n2 = tonumber(inputInicio.Text), tonumber(inputFim.Text)
    if not n1 or not n2 or n1 > n2 or n1 < 1 or n2 > 1000 then
        lblStatus.Text = "❌ Números inválidos!"
        lblStatus.TextColor3 = TEMA.Vermelho
        return
    end
    contagemAtiva = true
    contagemToken = contagemToken + 1
    local meuToken = contagemToken
    lblStatus.Text = "Contando..."
    lblStatus.TextColor3 = TEMA.Verde
    task.spawn(function()
        for i = n1, n2 do
            if not contagemAtiva or contagemToken ~= meuToken then break end
            enviarChat(numeroParaExtenso(i) .. "!")
            pularPersonagem()
            task.wait(2.5 + math.random() * 0.8)
        end
        if contagemToken == meuToken then
            contagemAtiva = false
            lblStatus.Text = "✅ Finalizado!"
        end
    end)
end)
btnStop.MouseButton1Click:Connect(function()
    contagemAtiva = false
    contagemToken = contagemToken + 1
    lblStatus.Text = "⏹ Parado."
    lblStatus.TextColor3 = TEMA.Vermelho
end)

--// ABA 3 — ESP
local abaESP = criarAba("ESP", "🎯", 3)
local btnToggleESP = Instance.new("TextButton")
btnToggleESP.Size = UDim2.new(1, 0, 0, 26)
btnToggleESP.BackgroundColor3 = TEMA.Verde
btnToggleESP.Text = "✅ ESP ON"
btnToggleESP.TextColor3 = Color3.fromRGB(255, 255, 255)
btnToggleESP.TextSize = 9
btnToggleESP.Font = Enum.Font.GothamBold
btnToggleESP.AutoButtonColor = false
btnToggleESP.LayoutOrder = 1
btnToggleESP.Parent = abaESP
local btnESPCorner = Instance.new("UICorner")
btnESPCorner.CornerRadius = UDim.new(0, 4)
btnESPCorner.Parent = btnToggleESP

local espFolder = Instance.new("Folder")
espFolder.Name = "BrigitteESP"
espFolder.Parent = gui
local bolinhas = {}
local espAtivo = true

local function criarBolinha(plr)
    if plr == player or not espAtivo then return end
    local function anexar(character)
        local hrp = character:WaitForChild("HumanoidRootPart", 5)
        if not hrp or not espAtivo then return end
        if bolinhas[plr] and bolinhas[plr].Parent then bolinhas[plr]:Destroy() end
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 10, 0, 10)
        billboard.AlwaysOnTop = true
        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
        billboard.Adornee = hrp
        billboard.Parent = espFolder
        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(1, 0, 1, 0)
        dot.BackgroundColor3 = Color3.fromRGB(0, 255, 80)
        dot.Parent = billboard
        local dC = Instance.new("UICorner")
        dC.CornerRadius = UDim.new(1, 0)
        dC.Parent = dot
        local dS = Instance.new("UIStroke")
        dS.Color = Color3.fromRGB(0, 0, 0)
        dS.Thickness = 1
        dS.Parent = dot
        bolinhas[plr] = billboard
    end
    if plr.Character then anexar(plr.Character) end
    plr.CharacterAdded:Connect(function(char) if espAtivo then anexar(char) end end)
end

local function removerTodasBolinhas()
    for plr, bb in pairs(bolinhas) do
        if bb and bb.Parent then bb:Destroy() end
        bolinhas[plr] = nil
    end
end

local function ativarESPTodos()
    for _, plr in ipairs(Players:GetPlayers()) do criarBolinha(plr) end
end

ativarESPTodos()
Players.PlayerAdded:Connect(function(plr) if espAtivo then criarBolinha(plr) end end)
Players.PlayerRemoving:Connect(function(plr)
    if bolinhas[plr] and bolinhas[plr].Parent then bolinhas[plr]:Destroy() end
    bolinhas[plr] = nil
end)

btnToggleESP.MouseButton1Click:Connect(function()
    espAtivo = not espAtivo
    if espAtivo then
        ativarESPTodos()
        btnToggleESP.Text = "✅ ESP ON"
        btnToggleESP.BackgroundColor3 = TEMA.Verde
    else
        removerTodasBolinhas()
        btnToggleESP.Text = "❌ ESP OFF"
        btnToggleESP.BackgroundColor3 = TEMA.Vermelho
    end
end)

--// AJUSTE DE TAMANHO E ARRASTAR
function atualizarTamanho()
    local abaAtual = nil
    for _, dados in pairs(abas) do
        if dados.container.Visible then abaAtual = dados.container break end
    end
    if not abaAtual then return end
    local alturaConteudo = abaAtual.UIListLayout.AbsoluteContentSize.Y + 8
    abaAtual.CanvasSize = UDim2.new(0, 0, 0, alturaConteudo)
    local alturaVisivel = math.min(alturaConteudo, 200)
    contentFrame.Size = UDim2.new(1, -8, 0, alturaVisivel)
    panel.Size = UDim2.new(0, 140, 0, 50 + alturaVisivel + 6)
end

for _, dados in pairs(abas) do
    dados.layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(atualizarTamanho)
end

abas["COMANDOS"].container.Visible = true
TweenService:Create(abas["COMANDOS"].botao, TweenInfo.new(0.1), { BackgroundColor3 = TEMA.Dourado, TextColor3 = Color3.fromRGB(20, 20, 20) }):Play()
atualizarTamanho()

local function tornarArrastavel(frame, handle)
    local arrastando, inicioMouse, inicioPos = false, nil, nil
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            arrastando = true
            inicioMouse = input.Position
            inicioPos = frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then arrastando = false end end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if arrastando and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - inicioMouse
            frame.Position = UDim2.new(inicioPos.X.Scale, inicioPos.X.Offset + delta.X, inicioPos.Y.Scale, inicioPos.Y.Offset + delta.Y)
        end
    end)
end
tornarArrastavel(panel, header)
tornarArrastavel(icon, icon)

local aberto, animando = false, false
local function abrirFechar()
    if animando then return end
    animando = true
    if not aberto then
        atualizarTamanho()
        local alturaFinal = panel.Size.Y.Offset
        panel.Position = UDim2.new(0, icon.Position.X.Offset + 45, 0, icon.Position.Y.Offset)
        panel.Visible = true
        panel.Size = UDim2.new(0, 140, 0, 0)
        TweenService:Create(panel, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 140, 0, alturaFinal) }):Play()
        aberto = true
    else
        local tween = TweenService:Create(panel, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { Size = UDim2.new(0, 140, 0, 0) })
        tween:Play()
        tween.Completed:Connect(function() panel.Visible = false end)
        aberto = false
    end
    task.wait(0.25)
    animando = false
end

icon.MouseButton1Click:Connect(abrirFechar)
closeBtn.MouseButton1Click:Connect(abrirFechar)

--// AUTO-DESTRUIÇÃO (Segurar 3s)
local tempoApertado, segurando, jaDestruido = 0, false, false
local function autoDestruir()
    if jaDestruido then return end
    jaDestruido = true
    contagemAtiva = false
    contagemToken = contagemToken + 1
    removerTodasBolinhas()
    if gui and gui.Parent then gui:Destroy() end
end
icon.MouseButton1Down:Connect(function() segurando = true; tempoApertado = tick() end)
icon.MouseButton1Up:Connect(function()
    if segurando then
        segurando = false
        if tick() - tempoApertado >= 3 then autoDestruir() end
    end
end)
