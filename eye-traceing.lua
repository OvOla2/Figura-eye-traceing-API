local function clamp(value, min, max)
    return value < min and min or (value > max and max or value)
end

local pupilUpdateTimer = 0
local PUPIL_UPDATE_INTERVAL = 2
local MAX_PUPIL_OFFSET = 0.5
local DEBUG_MODE = true

local function calculate_pupil_offset(rotationY)
    local normalized = clamp(rotationY / 35, -1, 1)
    return -normalized * MAX_PUPIL_OFFSET, 0, 0
end

function events.tick()
    pupilUpdateTimer = pupilUpdateTimer + 1
    if pupilUpdateTimer >= PUPIL_UPDATE_INTERVAL then
        local headRotationY = vanilla_model.HEAD:getOriginRot().y
        local x, y, z = calculate_pupil_offset(headRotationY)

        -- 同时设置左右眼瞳孔位置
        models.model.root.Torso.Head.Eyes.lefteye.leftpupil:pos(x, y, z)
        models.model.root.Torso.Head.Eyes.righteye.rightpupil:pos(x, y, z) -- 新增右眼控制

        if DEBUG_MODE then
            print("================")
            print("头部Y旋转:", headRotationY)
            print("计算后X偏移:", x)
            print("左眼位置:", x, y, z)
            print("右眼位置:", x, y, z) -- 新增右眼调试信息
        end

        pupilUpdateTimer = 0
    end
end
