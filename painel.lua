--// SERVIÇOS
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

--// TEMA
local TEMA = {
    Fundo  = Color3.fromRGB(25, 25, 30),
    Card   = Color3.fromRGB(40, 45, 55),
    Texto  = Color3.fromRGB(255, 255, 255),
    Vermelho = Color3.fromRGB(200, 60, 60),
    Azul   = Color3.fromRGB(60, 150, 255),
    Verde  = Color3.fromRGB(50, 180, 80),
}

--// GUI BASE
local gui = Instance.new("ScreenGui")
gui.Name = "GulososBotoes"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

--// FUNÇÃO DE CHAT
local function enviarChat(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
    else
        game.ReplicatedStorage.DefaultSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

--// BOTÃO PRINCIPAL (O GFC)
local btnMain = Instance.new("TextButton")
btnMain.Size = UDim2.new(0, 50, 0, 50)
btnMain.Position = UDim2.new(0, 20, 0, 100)
btnMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
btnMain.Text = ""
btnMain.Parent = gui
btnMain.AutoButtonColor = false
Instance.new("UICorner", btnMain).CornerRadius = UDim.new(1, 0)

local iconStroke = Instance.new("UIStroke", btnMain)
iconStroke.Color = Color3.fromRGB(0, 0, 0)
iconStroke.Thickness = 3

local star = Instance.new("TextLabel", btnMain)
star.Size = UDim2.new(1, 0, 0, 15)
star.Position = UDim2.new(0, 0, 0, -8)
star.BackgroundTransparency = 1
star.Text = "★"
star.TextColor3 = Color3.fromRGB(255, 200, 0)
star.TextSize = 16
star.Font = Enum.Font.GothamBold
star.ZIndex = 2

local txtTop = Instance.new("TextLabel", btnMain)
txtTop.Size = UDim2.new(1, 0, 0, 10)
txtTop.Position = UDim2.new(0, 0, 0, 8)
txtTop.BackgroundTransparency = 1
txtTop.Text = "GULOSOS"
txtTop.TextColor3 = Color3.fromRGB(0, 0, 0)
txtTop.TextSize = 7
txtTop.Font = Enum.Font.GothamBold

local txtMid = Instance.new("TextLabel", btnMain)
txtMid.Size = UDim2.new(1, 0, 1, 0)
txtMid.BackgroundTransparency = 1
txtMid.Text = "GFC"
txtMid.TextColor3 = Color3.fromRGB(0, 150, 50)
txtMid.TextSize = 16
txtMid.Font = Enum.Font.GothamBlack

--// SISTEMA DE ARRASTAR O BOTÃO PRINCIPAL
local arrastando = false
local inicioMouse, inicioPos
btnMain.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        arrastando = true
        inicioMouse = input.Position
        inicioPos = btnMain.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then arrastando = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if arrastando and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - inicioMouse
        if math.abs(delta.X) > 10 or math.abs(delta.Y) > 10 then
            btnMain.Position = UDim2.new(inicioPos.X.Scale, inicioPos.X.Offset + delta.X, inicioPos.Y.Scale, inicioPos.Y.Offset + delta.Y)
        end
    end
end)
--// CONTAINER DO MENU (A lista que abre)
local menuAberto = false
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 140, 0, 0) -- Largura do menu
menu.Position = UDim2.new(0, 80, 0, 100) -- Fica do lado do botão
menu.BackgroundColor3 = TEMA.Fundo
menu.Visible = false
menu.ClipsDescendants = true
Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 8)
local menuStroke = Instance.new("UIStroke", menu)
menuStroke.Color = TEMA.Card
menuStroke.Thickness = 1

local scrollMenu = Instance.new("ScrollingFrame", menu)
scrollMenu.Size = UDim2.new(1, -8, 0, 0)
scrollMenu.Position = UDim2.new(0, 4, 0, 4)
scrollMenu.BackgroundTransparency = 1
scrollMenu.BorderSizePixel = 0
scrollMenu.ScrollBarThickness = 3
scrollMenu.ScrollBarImageColor3 = TEMA.Azul
scrollMenu.CanvasSize = UDim2.new(0, 0, 0, 0)

local layoutMenu = Instance.new("UIListLayout", scrollMenu)
layoutMenu.Padding = UDim.new(0, 4)
layoutMenu.SortOrder = Enum.SortOrder.LayoutOrder

--// FUNÇÃO DE CRIAR BOTÃO DO MENU
local function addBotaoMenu(texto, cor, acao)
    local btn = Instance.new("TextButton", scrollMenu)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = TEMA.Card
    btn.Text = texto
    btn.TextColor3 = TEMA.Texto
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = cor end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = TEMA.Card end)
    btn.MouseButton1Click:Connect(function()
        acao()
        -- Fecha o menu automaticamente após clicar
        btnMain.MouseButton1Click:Fire() 
    end)
end

--// 1. COMANDOS DE AÇÃO
addBotaoMenu("💀 .MAT (Duplo)", TEMA.Vermelho, function()
    enviarChat(".mat"); task.wait(1.2); enviarChat(".mat")
end)
addBotaoMenu("🔗 .ALGEMAR", TEMA.Azul, function()
    enviarChat(".algemar")
end)
addBotaoMenu("🔪 .FURAR PNEU (Duplo)", TEMA.Vermelho, function()
    enviarChat(".furar pneu"); task.wait(1.2); enviarChat(".furar pneu")
end)

--// 2. RÁDIO E Q-CODES
addBotaoMenu("--- RÁDIO ---", TEMA.Card, function() end)
local qcodes = {"QAP", "QRV", "QTA", "QTI", "QRR", "QSL", "QTH"}
for _, q in ipairs(qcodes) do
    addBotaoMenu("📻 " .. q, TEMA.Azul, function()
        -- Quando clicar no código Q, ele manda direto pro chat no formato de rádio
        enviarChat("/r: " .. q .. " Transmitindo...") 
    end)
end

--// 3. JJ's RÁPIDO (1 a 5)
addBotaoMenu("🏃 JJ's (1 a 5)", TEMA.Verde, function()
    task.spawn(function()
        for i = 1, 5 do
            enviarChat(tostring(i) .. "!")
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            task.wait(1.2)
        end
    end)
end)

--// 4. ESP (Ligar/Desligar)
local espAtivo = true
local espFolder = Instance.new("Folder", gui)
local function atualizarBolinhas()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            if espAtivo then
                if not espFolder:FindFirstChild(plr.Name) then
                    local bb = Instance.new("BillboardGui", espFolder)
                    bb.Name = plr.Name; bb.Size = UDim2.new(0, 10, 0, 10); bb.AlwaysOnTop = true
                    bb.Adornee = plr.Character.Head; bb.StudsOffset = Vector3.new(0, 1.5, 0)
                    local dt = Instance.new("Frame", bb); dt.Size = UDim2.new(1, 0, 1, 0); dt.BackgroundColor3 = TEMA.Verde
                    Instance.new("UICorner", dt).CornerRadius = UDim.new(1, 0)
                end
            else
                local bolinha = espFolder:FindFirstChild(plr.Name)
                if bolinha then bolinha:Destroy() end
            end
        end
    end
end

local btnEspMenu = addBotaoMenu("👁️ ESP: ATIVADO", TEMA.Verde, function()
    espAtivo = not espAtivo
    if espAtivo then
        btnEspMenu.Text = "👁️ ESP: ATIVADO"
        btnEspMenu.TextColor3 = TEMA.Verde
    else
        btnEspMenu.Text = "🙈 ESP: DESATIVADO"
        btnEspMenu.TextColor3 = TEMA.Vermelho
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

--// 5. AUTO-DESTRUIÇÃO
addBotaoMenu("💥 DESTRUIR PAINEL", TEMA.Vermelho, function()
    gui:Destroy()
end)


--// AJUSTE DE TAMANHO DA LISTA
layoutMenu:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollMenu.CanvasSize = UDim2.new(0, 0, 0, layoutMenu.AbsoluteContentSize.Y + 10)
end)

--// LÓGICA DE ABRIR E FECHAR
btnMain.MouseButton1Click:Connect(function()
    menuAberto = not menuAberto
    if menuAberto then
        -- Posiciona o menu do lado do botão
        menu.Position = UDim2.new(0, btnMain.Position.X.Offset + 60, 0, btnMain.Position.Y.Offset)
        menu.Visible = true
        menu.Size = UDim2.new(0, 140, 0, 0)
        local altura = math.min(layoutMenu.AbsoluteContentSize.Y + 10, 250)
        
        TweenService:Create(menu, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 140, 0, altura)}):Play()
        TweenService:Create(scrollMenu, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, -8, 0, altura - 8)}):Play()
    else
        local t = TweenService:Create(menu, TweenInfo.new(0.15), {Size = UDim2.new(0, 140, 0, 0)})
        local t2 = TweenService:Create(scrollMenu, TweenInfo.new(0.15), {Size = UDim2.new(1, -8, 0, 0)})
        t:Play(); t2:Play()
        t.Completed:Connect(function() menu.Visible = false end)
    end
end)
