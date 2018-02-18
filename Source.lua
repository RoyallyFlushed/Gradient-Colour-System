--// Author: RoyallyFlushed; 18.2.18

TextLabel = false    --// Setting this to `false` activates `Example Mode`
Text = 'Hello, World!'    --// The Text shown if `Example Mode` is enabled
Increment = 5    --// This skips colours but increases the speed


local CreateLabel = function(player, txt)
    if not txt then
        local ui = Instance.new('ScreenGui',player:FindFirstChild('PlayerGui'))
        ui.Name = 'GradientUI'
        txt = Instance.new('TextLabel', ui)
        
        txt.Size = UDim2.new(0.2,0,0.1,0)
        txt.Position = UDim2.new(.4,0,0,0)
        
        txt.BackgroundTransparency = 1
        txt.Font = Enum.Font.SourceSansSemibold
        txt.TextSize = 60
        txt.TextColor3 = Color3.new(0,0,0)
        txt.Text = Text
    end

    return txt
end


local Gradient = function(txt)
    while wait() do
        --// Red up
        for i = 0, 255, Increment do
            txt.TextColor3 = Color3.new(i/255,0,0)
            wait()
        end
        --// Green up
        for i = 0, 255, Increment do
            txt.TextColor3 = Color3.new(1,i/255,0)
            wait()
        end
        --// Blue up
        for i = 0, 255, Increment do
            txt.TextColor3 = Color3.new(1,1,i/255)
            wait()
        end
        --// Red down
        for i = 0, 255, Increment do
            txt.TextColor3 = Color3.new((255-i)/255,1,1)
            wait()
        end
        --// Green down
        for i = 0, 255, Increment do
            txt.TextColor3 = Color3.new(0,(255-i)/255,1)
            wait()
        end
        --// Blue down
        for i = 0, 255, Increment do
            txt.TextColor3 = Color3.new(0,0,(255-i)/255)
            wait()
        end
    end
end


game.Players.PlayerAdded:connect(function(player)
    coroutine.resume(coroutine.create(Gradient(CreateLabel(player, TextLabel ~= false and TextLabel))))
end)
