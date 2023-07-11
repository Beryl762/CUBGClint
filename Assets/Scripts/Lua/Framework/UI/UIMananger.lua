
local UIManager = {}
local MainCanvas = GameObject.Find("Canvas")
UIManager.ViewStack = {}
UIManager.ModelList = {}

function UIManager:OpenUI(UIName, ...)
    local uiConfig = UIConfig[UIName]
    if uiConfig == nil then
        print("UIConfig[" .. UIName .. "] is nil")
        return
    end
    local Panel = self:LoadUI(uiConfig.LoadPath, ...)
    Panel.name = uiConfig.msg_name

    local Window = {model = nil, ctrl = nil}
    -- local model, ctrl = nil, nil
    if uiConfig.Model then
        if self.ModelList[uiConfig.Name] == nil then
            Window.model = uiConfig.Model:New()
            self.ModelList[uiConfig.Name] = Window.model
        else
            Window.model = self.ModelList[uiConfig.Name]
        end
    end
    if uiConfig.Ctrl then
        Window.ctrl = uiConfig.Ctrl:New()
    end
    if uiConfig.View then
        Window.view = uiConfig.View:New(Panel, uiConfig, 1, Window.Model, Window.Ctrl)
    end

    -- self:PushViewStack(Panel)
end

--Resources 加载UI界面
function UIManager:LoadUI(LoadPath, ...)
    local path = LoadPath
    local obj = Resources.Load(path)
    if obj == nil then
        print("Resources.Load[  " .. path .. "  ] is nil")
        return
    end
    local go = GameObject.Instantiate(obj)
    if go == nil then
        print("GameObject.Instantiate[  " .. path .. "  ] is nil")
        return
    end
    go.transform:SetParent(MainCanvas.transform, false)
    return go
end

-- 关闭界面
function UIManager:CloseUI(UIName)
    local uiConfig = UIConfig[UIName]
    if uiConfig == nil then
        print("UIConfig[" .. UIName .. "] is nil")
        return
    end
    if uiConfig.Hight then
    end
end

-- 面板放入ViewStack
function UIManager:PushViewStack(UIName)
    table.insert(self.ViewStack, UIName)
end

-- 面板从ViewStack移除
function UIManager:PopViewStack(UIName)
    table.remove(self.ViewStack, UIName)
end

return UIManager