local source = [[
	loadstring(game:HttpGetAsync("https://github.com/richie0866/remote-spy/releases/latest/download/RemoteSpy.lua"))()
]]

local env = getfenv()

-- Выполняем оригинальный loadstring
local result = loadstring(source)
if result then
	local uiRoot = result()

	-- Находим корневой GUI (если это ScreenGui, например)
	if typeof(uiRoot) == "Instance" and uiRoot:IsA("ScreenGui") then
		-- Центруем
		for _, child in ipairs(uiRoot:GetChildren()) do
			if child:IsA("Frame") or child:IsA("CanvasGroup") then
				child.AnchorPoint = Vector2.new(0.5, 0.5)
				child.Position = UDim2.new(0.5, 0, 0.5, 0)
			end
		end

		-- Добавляем масштаб
		local scale = Instance.new("UIScale")
		scale.Scale = 0.5
		scale.Parent = uiRoot
	end
end
