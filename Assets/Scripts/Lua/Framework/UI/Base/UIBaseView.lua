local UIBaseView = {}

local function __init(self, holder, var_arg, model, ctrl)
	assert(model ~= nil)
	assert(ctrl ~= nil)
	print(self.name)
	print(holder.name)
	print(var_arg.name)
	self.ctrl = ctrl
	-- 强制不能直接写Model层
	if true then
		self.model = setmetatable({}, {
			__index = model,
			__newindex = function(tb, key, value)
				error("You can't write model derectly!", 2)
			end
		})
	else 
		self.model = model
	end
	
	-- 窗口画布
	self.canvas = nil
	-- 窗口基础order，窗口内添加的其它canvas设置的order都以它做偏移
	self.base_order = 0
end

UIBaseView.__init = __init

return UIBaseView