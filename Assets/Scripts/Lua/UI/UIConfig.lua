local UIConfig = {}
-- 权重
local Weight =  {
    Hight = 1 ,  -- 最高级别
}

UIConfig.StartPanel = {
    Name = "StartPanel",
    LoadPath = "UI/StartPanel/StartPanel",
    View = require "UI/StartPanel/View/StartPanelView",
    Ctrl = require "UI/StartPanel/Ctrl/StartPanelCtrl",
    Model = require "UI/StartPanel/Model/StartPanelModel",
    Hight = Weight.Hight,
}

return UIConfig