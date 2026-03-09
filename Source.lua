-- Assassin Optimizer
-- 09/03/2026

if getgenv().Config.ReduceLag then
    spawn(function()
        for i, v in pairs(getgc(true)) do
            if type(v) == "function" and getinfo(v).name == "C1__" then
                debug.setconstant(v, 1, 0)
            end
        end
    end)
end

if getgenv().Config.RemoveChat then
    spawn(function()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.UI.Chat:Destroy()
    end)
end

