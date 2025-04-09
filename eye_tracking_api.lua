-- eye_tracking_api.lua
-- 眼球追踪系统 - 控制模型瞳孔根据头部旋转水平偏移

-- 数值钳制函数：将输入值限制在[min, max]范围内
-- @param value 输入值
-- @param min 最小值
-- @param max 最大值
-- @return 钳制后的数值
local function clamp(value, min, max)
    return value < min and min or (value > max and max or value)
end

-- 瞳孔更新计时器 (单位：游戏刻)
local pupilUpdateTimer = 0
-- 瞳孔位置更新间隔 (每2游戏刻更新一次)
local PUPIL_UPDATE_INTERVAL = 2
-- 瞳孔最大水平偏移量 (单位：方块坐标)
local MAX_PUPIL_OFFSET = 0.5
-- 调试模式开关 (true时输出运行数据)
local DEBUG_MODE = false

-- 计算瞳孔偏移量
-- @param rotationY 头部Y轴旋转角度 (-180~180度)
-- @return x, y, z 三维偏移量 (当前仅使用X轴)
local function calculate_pupil_offset(rotationY)
    -- 归一化处理：将旋转角度映射到[-1, 1]范围
    -- 35为灵敏度系数，值越大转动响应越平缓
    local normalized = clamp(rotationY / 35, -1, 1)
    -- 计算实际偏移量 (X轴取反实现自然跟随效果)
    return -normalized * MAX_PUPIL_OFFSET, 0, 0
end

-- 游戏刻事件监听器 (每帧执行)
function events.tick()
    pupilUpdateTimer = pupilUpdateTimer + 1
    -- 达到更新间隔时执行位置更新
    if pupilUpdateTimer >= PUPIL_UPDATE_INTERVAL then
        -- 获取头部Y轴旋转角度 (模型坐标系)
        local headRotationY = vanilla_model.HEAD:getOriginRot().y

        -- 计算瞳孔三维偏移量
        local x, y, z = calculate_pupil_offset(headRotationY)

        -- 设置左右眼瞳孔位置
        -- 左眼路径：models.model.root.Torso.Head.Eyes.lefteye.leftpupil
        models.model.root.Torso.Head.Eyes.lefteye.leftpupil:pos(x, y, z)
        -- 右眼路径：models.model.root.Torso.Head.Eyes.righteye.rightpupil
        models.model.root.Torso.Head.Eyes.righteye.rightpupil:pos(x, y, z)

        -- 调试模式输出信息
        if DEBUG_MODE then
            print("============== 瞳孔位置更新 ==============")
            print("头部Y轴旋转角度：", headRotationY.."°")
            print("计算X轴偏移量：", string.format("%.3f", x))
            print("左眼最终坐标：", string.format("(%.3f, %.3f, %.3f)", x, y, z))
            print("右眼最终坐标：", string.format("(%.3f, %.3f, %.3f)", x, y, z))
        end

        -- 重置计时器
        pupilUpdateTimer = 0
    end
end
