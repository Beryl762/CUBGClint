require ("Global/Global")

GameLuaMain = {}
function GameLuaMain.Start(self, ...)
	print("Start")
	UIManager:OpenUI(UIConfig.StartPanel.Name, "这是开始界面")
end

function Update()
end

return GameLuaMain