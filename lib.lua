--[[
    THIS HAS SOME BUGS THAT I CANT FIX BTW
    like 14 objects on one window is le limit
]]--




local lol = Instance.new("ScreenGui", game.CoreGui)
local uis = game:GetService("UserInputService")
lol.ZIndexBehavior = Enum.ZIndexBehavior.Global
lol.Name = "lol"

local lib = {
    windows = 0;
}

local function getNextWindowPos()
    local biggest = 0;
    local ok = nil;
    for i,v in pairs(lol:GetChildren()) do
        if v.Position.X.Offset>biggest then
            biggest = v.Position.X.Offset
            ok = v;
        end
    end
    if biggest == 0 then
        biggest = biggest + 5;
    else
        biggest = biggest + ok.Size.X.Offset + 5;
    end
    
    return biggest;
end

function lib:window(letitle)
    local instances = 0;
    local topbar = Instance.new("Frame", lol)
    local main = Instance.new("Frame", topbar)
    local UIListLayout = Instance.new("UIListLayout", main)
    local UIPadding = Instance.new("UIPadding", main)
    local title = Instance.new("TextLabel", topbar)

    topbar.Name = "topbar"
    topbar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    topbar.BorderSizePixel = 0
    topbar.Position = UDim2.new(0,getNextWindowPos()+10,0,10)
    topbar.Size = UDim2.new(0, 193, 0, 35)
    local UserInputService = game:GetService("UserInputService")

 
    --[[ps this is from a roblox dev fourm]]--
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        --topbar.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        topbar:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), "Out", "Sine", 0.2, true)
    end
    
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = topbar.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    topbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    main.Name = letitle
    main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(-0.00216113473, 0, 1, 0)
    main.Size = UDim2.new(1, 0, 0, (instances * 30)+10)
    main.ClipsDescendants = true

    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    
    UIPadding.PaddingLeft = UDim.new(0, 5)
    UIPadding.PaddingRight = UDim.new(0, 5)
    UIPadding.PaddingTop = UDim.new(0, 5)

    title.Name = "title"
    title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1.000
    title.BorderSizePixel = 0
    title.Position = UDim2.new(0.046632126, 0, 0, 0)
    title.Size = UDim2.new(0, 154, 0, 35)
    title.Font = Enum.Font.GothamBold
    title.Text = string.upper(letitle)
    title.TextColor3 = Color3.fromRGB(225, 225, 225)
    title.TextSize = 14.000
    title.TextXAlignment = Enum.TextXAlignment.Left
    
    local minimise = Instance.new("TextButton", topbar)
    local closed = false;

    minimise.Name = "minimise"
    minimise.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
    minimise.BackgroundTransparency = 1;
    minimise.BorderSizePixel = 0
    minimise.Position = UDim2.new(0.798531473, 0, 0, 0)
    minimise.Size = UDim2.new(0, 38, 0, 35)
    minimise.Font = Enum.Font.GothamBlack
    minimise.Text = "-"
    minimise.TextColor3 = Color3.new(0.882353, 0.882353, 0.882353)
    minimise.TextSize = 14
    minimise.MouseButton1Click:Connect(function()
         closed = not closed;
         main:TweenSize(UDim2.new(1, 0, 0, (closed and 0 or (instances * 34)+10)), "Out", "Sine", 0.5, true)
         minimise.Text = (closed and "+" or "-")
    end)
    local aa = {}

    function aa:button(title, callback)
        local buttonframe = Instance.new("Frame",main)
        local dabutt = Instance.new("TextButton",buttonframe)

        --Properties:

        buttonframe.Name = "buttonframe"
        buttonframe.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        buttonframe.BorderSizePixel = 0
        buttonframe.Size = UDim2.new(1, 0, 0, 31)

        dabutt.Name = "dabutt"
        dabutt.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        dabutt.BackgroundTransparency = 1.000
        dabutt.BorderColor3 = Color3.fromRGB(27, 42, 53)
        dabutt.BorderSizePixel = 0
        dabutt.Position = UDim2.new(-0.00141566806, 0, 0, 0)
        dabutt.Size = UDim2.new(1, 0, 0, 31)
        dabutt.Font = Enum.Font.Gotham
	dabutt.Text = title;
        dabutt.TextColor3 = Color3.fromRGB(225, 225, 225)
        dabutt.TextSize = 14.000
        dabutt.TextWrapped = true

        dabutt.MouseButton1Click:Connect(callback)
local Mouse = game.Players.LocalPlayer:GetMouse()
        
local a = Instance.new("ImageLabel", dabutt)
        a.Position = UDim2.new(0.5, 0, 0.5, 0)
        a.Image = "rbxassetid://3570695787"
        a.Size = UDim2.new(1, 0, 1, 0)
        a.ZIndex = 1
        a.AnchorPoint = Vector2.new(0.5, 0.5)
        a.BackgroundTransparency = 1
        a.ImageTransparency = 1
        a.ImageColor3 = Color3.new(225,225,225)
        a.ScaleType = "Slice"
        a.ClipsDescendants = true
        a.SliceCenter = Rect.new(100, 100, 100, 100)
        a.SliceScale = 0.05
        local Mouse = game.Players.LocalPlayer:GetMouse()
        
    
        dabutt.MouseButton1Down:Connect(function()
            --[[a.ImageTransparency = 0.3
            wait()
            a.ImageTransparency = 0]]
            local c = Instance.new("ImageLabel", a)
            c.BackgroundTransparency = 1
            c.Image = "rbxassetid://3570695787"
            c.ImageTransparency = 0.6
            c.Position = UDim2.new(0, (Mouse.X - c.AbsolutePosition.X), 0, (Mouse.Y - c.AbsolutePosition.Y))
            c.ScaleType = "Slice"
            c.SliceCenter = Rect.new(100, 100, 100, 100)
            c.SliceScale = 1
            local Size = 0
            if a.AbsoluteSize.X > a.AbsoluteSize.Y then
                Size = a.AbsoluteSize.X*1.5
            elseif a.AbsoluteSize.X < a.AbsoluteSize.Y then
                Size = a.AbsoluteSize.Y*1.5
            elseif a.AbsoluteSize.X == a.AbsoluteSize.Y then																																																																														print("This place uses a model by Come0n.") --please do not remove!
                Size = a.AbsoluteSize.X*1.5
            end
            c:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(.5, -Size/2, .5, -Size/2), "Out", "Linear", .5)
            dabutt.MouseButton1Up:Connect(function()
                while c.ImageTransparency ~= 1 do
                    wait()
                    c.ImageTransparency = c.ImageTransparency + 0.02
                    if c.ImageTransparency == 1 then c:Destroy() end
                end
            end)
        end)
        instances = instances + 1
        main.Size = UDim2.new(1, 0, 0, (instances * 34)+10)
    end
    function aa:textbox(title, callback)
        local datextbox = Instance.new("TextBox", main)
        datextbox.Name = "datextbox"
        datextbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        datextbox.BorderColor3 = Color3.fromRGB(100, 100, 100)
        datextbox.Size = UDim2.new(1, 0, 0, 30)
        datextbox.Font = Enum.Font.Gotham
        datextbox.PlaceholderText = title
        datextbox.Text = ""
        datextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
        datextbox.TextSize = 14.000
        datextbox.TextWrapped = true
        datextbox.ClearTextOnFocus = false
        local bottom = Instance.new("Frame", datextbox)
        bottom.Name = "bottom"
        bottom.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
        bottom.BorderSizePixel = 0
        bottom.Position = UDim2.new(0.00227922946, 0, 0.928340673, 0)
        bottom.Size = UDim2.new(0,0,0,2)
        datextbox.Focused:Connect(function()
            --0, 182, 0, 2
            bottom:TweenSize(UDim2.new(0, 182, 0, 2), "Out", "Sine", 0.3, true)
           
        end)
        datextbox.FocusLost:Connect(function()
            callback(datextbox.Text);
            bottom:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Sine", 0.3, true)
        end)
        instances = instances + 1
        main.Size = UDim2.new(1, 0, 0, (instances * 34)+10)
    end
    function aa:label(title)
        local dalabelspace = Instance.new("TextLabel", main)
        dalabelspace.Name = "dalabelspace"
        dalabelspace.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        dalabelspace.BorderSizePixel = 0
        dalabelspace.Position = UDim2.new(0.025906736, 0, 0.726708055, 0)
        dalabelspace.Size = UDim2.new(0, 182, 0, 30)
        dalabelspace.Font = Enum.Font.GothamBold
        dalabelspace.Text = title
        dalabelspace.BackgroundTransparency = 1;
        dalabelspace.TextColor3 = Color3.fromRGB(225, 225, 225)
        dalabelspace.TextSize = 15.000
        dalabelspace.TextWrapped = true;
        instances = instances + 1
        main.Size = UDim2.new(1, 0, 0, (instances * 34)+10)
    end
    function aa:section()
        local section = Instance.new("Frame", main)
        section.Name = "section"
        section.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        section.BorderSizePixel = 0
        section.Position = UDim2.new(0.025906736, 0, 0.275167793, 0)
        section.Size = UDim2.new(0, 183, 0, 1)
        instances = instances + 1
        main.Size = UDim2.new(1, 0, 0, (instances * 34)+10)
    end
    function aa:checkbox(title, callback)
        local checkbox = Instance.new("Frame", main)
        local checktit = Instance.new("TextLabel", checkbox)
        local dabutttttton = Instance.new("TextButton", checkbox)
        checkbox.Name = "checkbox"
        checkbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        checkbox.BorderSizePixel = 0
        checkbox.Size = UDim2.new(1, 0, 0, 34)

        checktit.Name = "checktit"
        checktit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        checktit.BackgroundTransparency = 1.000
        checktit.BorderSizePixel = 0
        checktit.Position = UDim2.new(-0.00254821591, 0, 0, 0)
        checktit.Size = UDim2.new(0, 141, 0, 34)
        checktit.Font = Enum.Font.GothamBold
        checktit.Text = string.upper(title)
        checktit.TextColor3 = Color3.fromRGB(225, 225, 225)
        checktit.TextSize = 14.000
        checktit.TextXAlignment = Enum.TextXAlignment.Left

        dabutttttton.Name = "dabutttttton"
        dabutttttton.BackgroundColor3 = Color3.new(1, 0.27451, 0.286275)
        dabutttttton.Position = UDim2.new(0.857923388, 0, 0.13333334, 0)
        dabutttttton.Size = UDim2.new(0, 23, 0, 21)
        dabutttttton.Font = Enum.Font.SourceSans
        dabutttttton.Text = ""
        dabutttttton.TextColor3 = Color3.new(0, 0, 0)
        dabutttttton.TextSize = 14


        local Enabled = false;
        dabutttttton.MouseButton1Click:Connect(function()
        Enabled = not Enabled;
        local a = game:GetService("TweenService"):Create(dabutttttton, TweenInfo.new(0.2), {BackgroundColor3 = (Enabled and Color3.fromRGB(255,255,255) or Color3.fromRGB(211, 47, 47))})
        a:Play()
        callback(Enabled)
        end)
        instances = instances + 1
        main.Size = UDim2.new(1, 0, 0, (instances * 34)+10)
        
    end
    
    --[[use fluxus today!!!]]--
    function aa:slider(title, min, max, startPoint, callback)
        instances = instances + 1
        local dragging = false;
        local label = Instance.new("TextLabel")
        local sliderFrame = Instance.new("ImageLabel")
        local slidingFrame = Instance.new("ImageLabel")
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 0, 35)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.TextSize = 14
        label.Font = "GothamBold"
        label.Parent = main
        label.TextXAlignment = "Left"
        label.Text = string.upper(title)
        sliderFrame.Name = "sliderFrame"
        sliderFrame.Parent = label
        sliderFrame.BackgroundTransparency = 1
        sliderFrame.Position = UDim2.new(1, -80, 0.5, -3)
        sliderFrame.Size = UDim2.new(0, 80, 0, 6)
        sliderFrame.Image = "rbxassetid://3570695787"
        sliderFrame.ImageColor3 = Color3.fromRGB(75, 75, 75)
        sliderFrame.ScaleType = "Slice"
        sliderFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        slidingFrame.Name = "slidingFrame"
        slidingFrame.Parent = sliderFrame
        slidingFrame.BackgroundTransparency = 1
        slidingFrame.Position = UDim2.new((startPoint or 0)/max, -6, 0.5, -5)
        slidingFrame.Size = UDim2.new(0, 10, 0, 10)
        slidingFrame.Image = "rbxassetid://3570695787"
        slidingFrame.ScaleType = "Slice"
        slidingFrame.SliceCenter = Rect.new(100, 100, 100, 100)
        slidingFrame.ImageColor3 = Color3.fromRGB(255, 255, 255)
        local val = Instance.new("TextLabel", sliderFrame)
        val.BackgroundTransparency = 1
        val.Position = UDim2.new(0, 0, 1, 1)
        val.Size = UDim2.new(1, 0, 0, 10)
        val.Font = "GothamBold"
        val.TextColor3 = Color3.new(1, 1, 1)
        val.TextScaled = true
        val.TextTransparency = 1
        val.Text = tostring(startPoint and math.floor((startPoint / max) * (max - min) + min) or 0).."/"..tostring(max)
        main.Size = UDim2.new(1, 0, 0, (instances * 34)+10)
        -- Dragging Function --
	    local function move(input)
	        local pos = UDim2.new(math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1), -6, 0.5, -5)
            slidingFrame:TweenPosition(pos, "Out", "Sine", 0.1, true);
            local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
            val.Text = tostring(value).."/"..tostring(max);
            callback(value)
	    end
	    slidingFrame.InputBegan:Connect(function(input)
	        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true;
                local b = game:GetService("TweenService"):Create(val, TweenInfo.new(0.2), {TextTransparency = 0})
                b:Play()
	        end
	    end)
	    slidingFrame.InputEnded:Connect(function(input)
	        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false;
                wait(1)
                local b = game:GetService("TweenService"):Create(val, TweenInfo.new(0.2), {TextTransparency = 1})
                b:Play()
	        end
	    end)
	    game:GetService("UserInputService").InputChanged:Connect(function(input)
	        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
	            move(input)
	        end
        end)
        
	    -----------------------
    end

    return aa;
end
return lib;
