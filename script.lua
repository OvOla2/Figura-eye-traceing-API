---------------------------------------------------
-- 引入眼球追踪API模块
local eyeTracking = require("eye_tracking_api")

-- 自定义配置参数（覆盖默认值）
eyeTracking.init({
    -- [!] 必须根据实际模型层级结构填写路径
    left_eye_path = "model.root.Torso.Head.Eyes.lefteye.leftpupil", -- 左眼瞳孔部件的完整路径（点分隔层级）
    right_eye_path = "model.root.Torso.Head.Eyes.righteye.rightpupil", -- 右眼瞳孔部件的完整路径
    head_part = "Head", -- 头部模型部件的名称（需与model文件中的部件名一致）

    -- [!] 参数调节区
    max_offset = 0.5, -- 瞳孔最大水平偏移量（单位：游戏内方块坐标，建议0.3~0.7）
    sensitivity = 35, -- 灵敏度系数（值越大响应越平缓，建议20~50）
    update_interval = 3, -- 更新间隔（单位：游戏刻，1秒=20刻，建议2~5）
    debug_mode = false -- 调试模式开关（true时输出实时数据）
})






