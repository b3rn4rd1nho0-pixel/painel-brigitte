--// SERVIÇOS
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

--// TEMA
local TEMA = {
    Fundo      = Color3.fromRGB(15, 17, 20),
    Painel     = Color3.fromRGB(22, 25, 30),
    Card       = Color3.fromRGB(32, 38, 45),
    Hover      = Color3.fromRGB(45, 55, 65),
    Azul       = Color3.fromRGB(60, 150, 255),
    Texto      = Color3.fromRGB(220, 225, 230),
    TextoSub   = Color3.fromRGB(130, 140, 150),
    Vermelho   = Color3.fromRGB(200, 60, 60),
    Verde      = Color3.fromRGB(50, 180, 80),
}

--// GUI BASE
local gui = Instance.new("ScreenGui")
gui.Name = "PainelGulosos"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

--// ÍCONE (ESCUDO GULOSOS FC)
local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0, 45, 0, 45)
icon.Position = UDim2.new(0, 20, 0, 100)
icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
icon.Text = ""
icon.Parent = gui
icon.AutoButtonColor = false
Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

local iconStroke = Instance.new("UIStroke", icon)
iconStroke.Color = Color3.fromRGB(0, 0, 0)
iconStroke.Thickness = 3

local star = Instance.new("TextLabel", icon)
star.Size = UDim2.new(1, 0, 0, 15)
star.Position = UDim2.new(0, 0, 0, -8)
star.BackgroundTransparency = 1
star.Text = "★"
star.TextColor3 = Color3.fromRGB(255, 200, 0)
star.TextSize = 16
star.Font = Enum.Font.GothamBold
star.ZIndex = 2

local txtTop = Instance.new("TextLabel", icon)
txtTop.Size = UDim2.new(1, 0, 0, 10)
txtTop.Position = UDim2.new(0, 0, 0, 8)
txtTop.BackgroundTransparency = 1
txtTop.Text = "GULOSOS"
txtTop.TextColor3 = Color3.fromRGB(0, 0, 0)
txtTop.TextSize = 7
txtTop.Font = Enum.Font.GothamBold

local txtMid = Instance.new("TextLabel", icon)
txtMid.Size = UDim2.new(1, 0, 1, 0)
txtMid.BackgroundTransparency = 1
txtMid.Text = "GFC"
txtMid.TextColor3 = Color3.fromRGB(0, 150, 50)
txtMid.TextSize = 16
txtMid.Font = Enum.Font.GothamBlack

local txtBot = Instance.new("TextLabel", icon)
txtBot.Size = UDim2.new(1, 0, 0, 10)
txtBot.Position = UDim2.new(0, 0, 1, -15)
txtBot.BackgroundTransparency = 1
txtBot.Text = "FUTEBOL CLUBE"
txtBot.TextColor3 = Color3.fromRGB(0, 0, 0)
txtBot.TextSize = 6
txtBot.Font = Enum.Font.GothamBold

--// PAINEL
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 220, 0, 0)
panel.Position = UDim2.new(0, 20, 0, 150)
panel.BackgroundColor3 = TEMA.Painel
panel.Visible = false
panel.ClipsDescendants = true
panel.Parent = gui
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 8)
local panelStroke = Instance.new("UIStroke", panel)
panelStroke.Color = TEMA.Card
panelStroke.Thickness = 1

--// HEADER
local header = Instance.new("Frame", panel)
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundColor3 = TEMA.Card
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)
local headerFix = Instance.new("Frame", header)
headerFix.Size = UDim2.new(1, 0, 0, 10)
headerFix.Position = UDim2.new(0, 0, 1, -10)
headerFix.BackgroundColor3 = TEMA.Card
headerFix.BorderSizePixel = 0
local headerLine = Instance.new("Frame", header)
headerLine.Size = UDim2.new(1, 0, 0, 2)
headerLine.Position = UDim2.new(0, 0, 1, -2)
headerLine.BackgroundColor3 = TEMA.Verde
headerLine.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -40, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "GULOSOS FUTEBOL CLUBE"
title.TextColor3 = Color3.fromRGB(0, 200, 80)
title.TextSize = 9
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 20, 0, 20)
closeBtn.Position = UDim2.new(1, -25, 0.5, -10)
closeBtn.BackgroundColor3 = TEMA.Fundo
closeBtn.Text = "X"
closeBtn.TextColor3 = TEMA.Vermelho
closeBtn.TextSize = 10
closeBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 4)

--// MENU DE ABAS (Ajustado para 5 abas)
local tabsBar = Instance.new("Frame", panel)
tabsBar.Size = UDim2.new(1, -10, 0, 26)
tabsBar.Position = UDim2.new(0, 5, 0, 36)
tabsBar.BackgroundTransparency = 1

local tabsLayout = Instance.new("UIListLayout", tabsBar)
tabsLayout.FillDirection = Enum.FillDirection.Horizontal
tabsLayout.Padding = UDim.new(0, 2)
tabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local contentFrame = Instance.new("Frame", panel)
contentFrame.Size = UDim2.new(1, -10, 0, 0)
contentFrame.Position = UDim2.new(0, 5, 0, 66)
contentFrame.BackgroundTransparency = 1

--// CHAT
local function enviarChat(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

--// SISTEMA DE ABAS
local abas = {}
local function criarAba(nome, ordem)
    local btn = Instance.new("TextButton", tabsBar)
    btn.Size = UDim2.new(0, 39, 1, 0)
    btn.BackgroundColor3 = TEMA.Card
    btn.Text = nome
    btn.TextColor3 = TEMA.TextoSub
    btn.TextSize = 7
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.LayoutOrder = ordem
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

    local scroll = Instance.new("ScrollingFrame", contentFrame)
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 4
    scroll.ScrollBarImageColor3 = TEMA.Azul
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollingDirection = Enum.ScrollingDirection.Y
    scroll.ScrollingEnabled = true 
    scroll.ElasticBehavior = Enum.ElasticBehavior.Never 
    scroll.Visible = false

    local list = Instance.new("UIListLayout", scroll)
    list.Padding = UDim.new(0, 4)
    list.SortOrder = Enum.SortOrder.LayoutOrder

    abas[nome] = { btn = btn, scroll = scroll, list = list }

    btn.MouseButton1Click:Connect(function()
        for _, a in pairs(abas) do
            a.scroll.Visible = false
            TweenService:Create(a.btn, TweenInfo.new(0.1), { BackgroundColor3 = TEMA.Card, TextColor3 = TEMA.TextoSub }):Play()
        end
        scroll.Visible = true
        TweenService:Create(btn, TweenInfo.new(0.1), { BackgroundColor3 = TEMA.Verde, TextColor3 = Color3.fromRGB(0,0,0) }):Play()
        atualizarTamanho()
    end)
    return scroll
end
--// CONVERSOR JJ's
local un = {[1]="UM",[2]="DOIS",[3]="TRÊS",[4]="QUATRO",[5]="CINCO",[6]="SEIS",[7]="SETE",[8]="OITO",[9]="NOVE"}
local esp = {[10]="DEZ",[11]="ONZE",[12]="DOZE",[13]="TREZE",[14]="CATORZE",[15]="QUINZE",[16]="DEZESSEIS",[17]="DEZESSETE",[18]="DEZOITO",[19]="DEZENOVE"}
local dez = {[2]="VINTE",[3]="TRINTA",[4]="QUARENTA",[5]="CINQUENTA",[6]="SESSENTA",[7]="SETENTA",[8]="OITENTA",[9]="NOVENTA"}
local cen = {[1]="CENTO",[2]="DUZENTOS",[3]="TREZENTOS",[4]="QUATROCENTOS",[5]="QUINHENTOS",[6]="SEISCENTOS",[7]="SETECENTOS",[8]="OITOCENTOS",[9]="NOVECENTOS"}
local function numExt(n)
    if n==100 then return "CEM" elseif n==1000 then return "MIL" elseif n<1 or n>1000 then return tostring(n) end
    local p, c, r = {}, math.floor(n/100), n%100
    if c>0 then table.insert(p, cen[c]) end
    if r>=10 and r<=19 then table.insert(p, esp[r])
    elseif r>=20 then local d, u = math.floor(r/10), r%10; table.insert(p, u>0 and (dez[d].." E "..un[u]) or dez[d])
    elseif r>=1 then table.insert(p, un[r]) end
    return table.concat(p, " E ")
end

--// GERADOR DE BOTÕES
local function criarBotao(parent, texto, desc, cor, acao)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundColor3 = TEMA.Card
    btn.Text = ""
    btn.AutoButtonColor = false
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = TEMA.Hover

    local txt = Instance.new("TextLabel", btn)
    txt.Size = UDim2.new(1, -10, 0, 14)
    txt.Position = UDim2.new(0, 8, 0, 4)
    txt.BackgroundTransparency = 1
    txt.Text = texto
    txt.TextColor3 = TEMA.Texto
    txt.TextSize = 10
    txt.Font = Enum.Font.GothamBold
    txt.TextXAlignment = Enum.TextXAlignment.Left

    local sub = Instance.new("TextLabel", btn)
    sub.Size = UDim2.new(1, -10, 0, 10)
    sub.Position = UDim2.new(0, 8, 0, 20)
    sub.BackgroundTransparency = 1
    sub.Text = desc
    sub.TextColor3 = TEMA.TextoSub
    sub.TextSize = 8
    sub.TextXAlignment = Enum.TextXAlignment.Left

    btn.MouseEnter:Connect(function() TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = TEMA.Hover}):Play(); stroke.Color = cor end)
    btn.MouseLeave:Connect(function() TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = TEMA.Card}):Play(); stroke.Color = TEMA.Hover end)
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), {BackgroundColor3 = cor}):Play()
        task.delay(0.1, function() TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = TEMA.Card}):Play() end)
        acao()
    end)
    return btn
end

local function cmdDuplo(msg)
    enviarChat(msg)
    task.wait(1.2)
    enviarChat(msg)
end

--// ABA 1 — AÇÕES
local abaAcoes = criarAba("AÇÕES", 1)
local acoes = {
    {".mat", "Duplo", TEMA.Vermelho, function() cmdDuplo(".mat") end},
    {".render", "Duplo", TEMA.Vermelho, function() cmdDuplo(".render") end},
    {".furar pneu", "Duplo", TEMA.Vermelho, function() cmdDuplo(".furar pneu") end},
    {".algemar", "Único", TEMA.Azul, function() enviarChat(".algemar") end},
    {".revistar", "Único", TEMA.Azul, function() enviarChat(".revistar") end},
    {".soco", "Único", TEMA.Card, function() enviarChat(".soco") end},
    {".chute", "Único", TEMA.Card, function() enviarChat(".chute") end},
    {".pegar", "Único", TEMA.Card, function() enviarChat(".pegar") end},
}
for _, a in ipairs(acoes) do criarBotao(abaAcoes, a[1], a[2], a[3], a[4]) end

--// ABA 2 — VEÍCULOS
local abaVeic = criarAba("VEÍC", 2)
local veiculos = {
    {"Spawn Viatura", "Puxar carro", TEMA.Azul, function() enviarChat(".spawn viatura") end},
    {"Reparar Carro", "Consertar", TEMA.Azul, function() enviarChat(".reparar") end},
    {"Rajar Carro", "Duplo", TEMA.Vermelho, function() cmdDuplo(".rajar carro") end},
    {"Rajar Heli", "Duplo", TEMA.Vermelho, function() cmdDuplo(".rajar heli") end},
}
for _, v in ipairs(veiculos) do criarBotao(abaVeic, v[1], v[2], v[3], v[4]) end

--// ABA 3 — RÁDIO
local abaRadio = criarAba("RÁDIO", 3)
local boxRadio = Instance.new("Frame", abaRadio)
boxRadio.Size = UDim2.new(1, 0, 0, 45)
boxRadio.BackgroundColor3 = TEMA.Fundo
boxRadio.Parent = abaRadio
Instance.new("UICorner", boxRadio).CornerRadius = UDim.new(0, 4)

local inputQ = Instance.new("TextBox", boxRadio)
inputQ.Size = UDim2.new(1, -10, 0, 20)
inputQ.Position = UDim2.new(0, 5, 0, 2)
inputQ.BackgroundTransparency = 1
inputQ.PlaceholderText = "Código Q"
inputQ.TextColor3 = TEMA.Texto
inputQ.TextSize = 9
inputQ.Font = Enum.Font.GothamBold
inputQ.Parent = boxRadio

local inputMsg = Instance.new("TextBox", boxRadio)
inputMsg.Size = UDim2.new(1, -10, 0, 20)
inputMsg.Position = UDim2.new(0, 5, 0, 22)
inputMsg.BackgroundTransparency = 1
inputMsg.PlaceholderText = "Mensagem..."
inputMsg.TextColor3 = TEMA.Texto
inputMsg.TextSize = 9
inputMsg.Parent = boxRadio

criarBotao(abaRadio, "ENVIAR RÁDIO", "Manda /r: [Q] [Msg]", TEMA.Verde, function()
    local q = inputQ.Text
    local m = inputMsg.Text
    if q ~= "" and m ~= "" then
        enviarChat("/r: " .. q .. " " .. m)
    end
end)

local listaAberta = false
local btnDropdown = criarBotao(abaRadio, "SELECIONAR CÓDIGO Q ▼", "Clique para ver a lista", TEMA.Azul, function()
    listaAberta = not listaAberta
    scrollLista.Visible = listaAberta
    btnDropdown.TextLabel.Text = listaAberta and "FECHAR LISTA ▲" or "SELECIONAR CÓDIGO Q ▼"
    atualizarTamanho()
end)

local scrollLista = Instance.new("ScrollingFrame", abaRadio)
scrollLista.Size = UDim2.new(1, 0, 0, 180)
scrollLista.BackgroundColor3 = TEMA.Fundo
scrollLista.BorderSizePixel = 0
scrollLista.Visible = false
scrollLista.ScrollBarThickness = 2
scrollLista.ScrollBarImageColor3 = TEMA.Azul
Instance.new("UICorner", scrollLista).CornerRadius = UDim.new(0, 4)

local layoutLista = Instance.new("UIListLayout", scrollLista)
layoutLista.Padding = UDim.new(0, 2)
layoutLista.SortOrder = Enum.SortOrder.LayoutOrder

local qcodes = {
    {"QAP", "Aguardando ordens. 'Na escuta, aguardando instruções'."},
    {"QRV", "Estou pronto. 'Rádio pronto para transmitir, pode falar'."},
    {"QRA", "Identificação. 'Meu nome/número de identificação é...'."},
    {"QTH", "Localização. 'Minha posição atual é...'."},
    {"QTR", "Horário. 'O horário exato agora é...'."},
    {"QRR", "Rádio padrão. 'Transmitindo para a central'."},
    {"QTA", "Táxi/Viatura. 'Solicito viatura para apoio no local'."},
    {"QTI", "Tático. 'Iniciando intervenção tática, código 3'."},
    {"QSL", "Entendido. 'Confirmo que recebi e entendi a mensagem'."},
    {"QSM", "Repetir. 'Não entendi, repita a última mensagem'."},
    {"QSJ", "Valores. 'Referente ao pagamento ou dinheiro'."},
    {"QSY", "Mudar freq. 'Vou trocar de canal, aguarde'."},
    {"QRL", "Ocupado. 'Estou em ocorrência, não posso falar agora'."},
    {"QRT", "Parar. 'Encerrando a transmissão de rádio'."},
    {"QSD", "Defeito. 'Meu rádio está com problema técnico'."},
    {"QSB", "Ruído. 'Sinal fraco, muita interferência'."},
    {"QSA", "Sinal. 'A força do meu sinal é forte/fraca'."},
    {"QRX", "Esperar. 'Aguarde um momento no rádio'."},
    {"QRZ", "Quem é? 'Quem está chamando? Identifique-se'."},
    {"QSO", "Direto. 'Posso falar diretamente com você'."},
    {"QSP", "Retransmitir. 'Passe a mensagem para o comando'."},
    {"QTX", "Desligar. 'Vou sair do rádio por um tempo'."},
    {"QUD", "Urgente. 'Código vermelho, preciso de ajuda imediata'."},
    {"QTV", "Vigilância. 'Mantendo vigilância no perímetro'."}
}

for i, q in ipairs(qcodes) do
    local btnQ = Instance.new("TextButton", scrollLista)
    btnQ.Size = UDim2.new(1, -4, 0, 32)
    btnQ.BackgroundColor3 = TEMA.Card
    btnQ.Text = ""
    btnQ.LayoutOrder = i
    btnQ.Parent = scrollLista
    Instance.new("UICorner", btnQ).CornerRadius = UDim.new(0, 3)
    
    local qCode = Instance.new("TextLabel", btnQ)
    qCode.Size = UDim2.new(0, 35, 1, 0)
    qCode.Position = UDim2.new(0, 5, 0, 0)
    qCode.BackgroundTransparency = 1
    qCode.Text = q[1]
    qCode.TextColor3 = TEMA.Azul
    qCode.TextSize = 9
    qCode.Font = Enum.Font.GothamBold
    qCode.Parent = btnQ

    local qDesc = Instance.new("TextLabel", btnQ)
    qDesc.Size = UDim2.new(1, -45, 1, 0)
    qDesc.Position = UDim2.new(0, 40, 0, 0)
    qDesc.BackgroundTransparency = 1
    qDesc.Text = q[2]
    qDesc.TextColor3 = TEMA.TextoSub
    qDesc.TextSize = 8
    qDesc.TextXAlignment = Enum.TextXAlignment.Left
    qDesc.TextWrapped = true
    qDesc.Parent = btnQ
    
    btnQ.MouseEnter:Connect(function() btnQ.BackgroundColor3 = TEMA.Hover end)
    btnQ.MouseLeave:Connect(function() btnQ.BackgroundColor3 = TEMA.Card end)
    btnQ.MouseButton1Click:Connect(function()
        inputQ.Text = q[1]
        listaAberta = false
        scrollLista.Visible = false
        btnDropdown.TextLabel.Text = "SELECIONAR CÓDIGO Q ▼"
        inputMsg:CaptureFocus()
        atualizarTamanho()
    end)
end

layoutLista:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollLista.CanvasSize = UDim2.new(0, 0, 0, layoutLista.AbsoluteContentSize.Y + 4)
end)

--// ABA 4 — JJ's (1.2s)
local abaJJ = criarAba("JJ's", 4)
local boxJJ = Instance.new("Frame", abaJJ)
boxJJ.Size = UDim2.new(1, 0, 0, 22)
boxJJ.BackgroundColor3 = TEMA.Fundo
boxJJ.Parent = abaJJ
Instance.new("UICorner", boxJJ).CornerRadius = UDim.new(0, 4)

local inputIni = Instance.new("TextBox", boxJJ)
inputIni.Size = UDim2.new(0.5, -2, 1, 0)
inputIni.BackgroundTransparency = 1
inputIni.PlaceholderText = "De"
inputIni.TextColor3 = TEMA.Texto
inputIni.TextSize = 9
inputIni.Parent = boxJJ

local inputFim = Instance.new("TextBox", boxJJ)
inputFim.Size = UDim2.new(0.5, -2, 1, 0)
inputFim.Position = UDim2.new(0.5, 2, 0, 0)
inputFim.BackgroundTransparency = 1
inputFim.PlaceholderText = "Até"
inputFim.TextColor3 = TEMA.Texto
inputFim.TextSize = 9
inputFim.Parent = boxJJ

local contando, token = false, 0
criarBotao(abaJJ, "INICIAR", "1.2s por msg", TEMA.Verde, function()
    local n1, n2 = tonumber(inputIni.Text), tonumber(inputFim.Text)
    if not n1 or not n2 or n1 > n2 then return end
    contando = true
    token = token + 1
    local meuToken = token
    task.spawn(function()
        for i = n1, n2 do
            if not contando or token ~= meuToken then break end
            enviarChat(numExt(i) .. "!")
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
            task.wait(1.2)
        end
    end)
end)
criarBotao(abaJJ, "PARAR", "Para contagem", TEMA.Vermelho, function()
    contando = false
    token = token + 1
end)

--// ABA 5 — ESP (LIGAR/DESLIGAR)
local abaESP = criarAba("ESP", 5)
local espAtivo = true
local espFolder = Instance.new("Folder", gui)

local function atualizarBolinhas()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            if espAtivo then
                if not espFolder:FindFirstChild(plr.Name) then
                    local bb = Instance.new("BillboardGui", espFolder)
                    bb.Name = plr.Name
                    bb.Size = UDim2.new(0, 10, 0, 10)
                    bb.AlwaysOnTop = true
                    bb.Adornee = plr.Character.Head
                    bb.StudsOffset = Vector3.new(0, 1.5, 0)
                    
                    local dt = Instance.new("Frame", bb)
                    dt.Size = UDim2.new(1, 0, 1, 0)
                    dt.BackgroundColor3 = TEMA.Verde
                    Instance.new("UICorner", dt).CornerRadius = UDim.new(1, 0)
                end
            else
                local bolinha = espFolder:FindFirstChild(plr.Name)
                if bolinha then bolinha:Destroy() end
            end
        end
    end
end

local btnEsp = criarBotao(abaESP, "ESP: ATIVADO", "Clique para desativar as bolinhas", TEMA.Verde, function()
    espAtivo = not espAtivo
    if espAtivo then
        btnEsp.TextLabel.Text = "ESP: ATIVADO"
        btnEsp.TextLabel.TextColor3 = TEMA.Verde
    else
        btnEsp.TextLabel.Text = "ESP: DESATIVADO"
        btnEsp.TextLabel.TextColor3 = TEMA.Vermelho
        for _, b in pairs(espFolder:GetChildren()) do b:Destroy() end
    end
    atualizarBolinhas()
end)

task.spawn(function()
    while gui.Parent do
        if espAtivo then atualizarBolinhas() end
        task.wait(2)
    end
end)

--// COMPATIBILIDADE COM AS ABAS
abas["ESP"] = { btn = abaESP.Parent, scroll = abaESP, list = abaESP.UIListLayout }

--// AJUSTE DE TAMANHO E ROLAGEM FINAL
function atualizarTamanho()
    local abaAtual
    for _, a in pairs(abas) do if a.scroll.Visible then abaAtual = a.scroll break end end
    if not abaAtual then return end
    local h = abaAtual.UIListLayout.AbsoluteContentSize.Y + 5
    abaAtual.CanvasSize = UDim2.new(0, 0, 0, h)
    local alturaVisivel = math.min(h, 280)
    contentFrame.Size = UDim2.new(1, -10, 0, alturaVisivel)
    panel.Size = UDim2.new(0, 220, 0, 66 + alturaVisivel + 5)
end

for _, a in pairs(abas) do a.list:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(atualizarTamanho) end
abas["AÇÕES"].scroll.Visible = true
TweenService:Create(abas["AÇÕES"].btn, TweenInfo.new(0.1), { BackgroundColor3 = TEMA.Verde, TextColor3 = Color3.fromRGB(0,0,0) }):Play()
atualizarTamanho()

--// ARRASTAR
local function arrastar(f, h)
    local on, start, pos = false, nil, nil
    h.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            on = true; start = i.Position; pos = f.Position
            i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then on = false end end)
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if on and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local d = i.Position - start
            f.Position = UDim2.new(pos.X.Scale, pos.X.Offset + d.X, pos.Y.Scale, pos.Y.Offset + d.Y)
        end
    end)
end
arrastar(panel, header)
arrastar(icon, icon)

--// ABRIR E FECHAR
local open, anim = false, false
local function togglePanel()
    if anim then return end; anim = true
    if not open then
        atualizarTamanho()
        local finalSize = panel.Size
        panel.Position = UDim2.new(0, icon.Position.X.Offset + 55, 0, icon.Position.Y.Offset)
        panel.Visible = true
        panel.Size = UDim2.new(0, 220, 0, 0)
        TweenService:Create(panel, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = finalSize}):Play()
        open = true
    else
        local t = TweenService:Create(panel, TweenInfo.new(0.15), {Size = UDim2.new(0, 220, 0, 0)})
        t:Play(); t.Completed:Connect(function() panel.Visible = false end)
        open = false
    end
    task.wait(0.25); anim = false
end

icon.MouseButton1Click:Connect(togglePanel)
closeBtn.MouseButton1Click:Connect(togglePanel)

--// AUTO-DESTRUIÇÃO
local seg, tempo = false, 0
icon.MouseButton1Down:Connect(function() seg = true; tempo = tick() end)
icon.MouseButton1Up:Connect(function()
    if seg then
        seg = false
        if tick() - tempo >= 3 then
            if gui then gui:Destroy() end
        end
    end
end)
