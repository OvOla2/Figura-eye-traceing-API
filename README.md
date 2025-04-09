# 眼球追踪API | Eye Tracking API | アイートラッキングAPI

---

<!-- 中文版 -->
## 中文版

### 简介
此Lua API用于在Figura-blockbench模型中实现眼球动态追踪功能。通过检测头部旋转角度，自动调整瞳孔的水平偏移位置，增强模型的自然表现。

### 安装
1. 将 `eye_tracking_api.lua` 放入项目脚本目录。
2. 在 `script.lua` 中调用API并配置参数。

### 快速开始
```lua
local eyeTracking = require("eye_tracking_api")

eyeTracking.init({
    left_eye_path  = "model.root.Head.LeftEye.Pupil", -- 左眼路径
    right_eye_path = "model.root.Head.RightEye.Pupil", -- 右眼路径
    head_part      = "Head",   -- 头部部件名
    sensitivity    = 35,       -- 灵敏度（值越大反应越慢）
    debug_mode     = true      -- 开启调试
})
```

### 配置参数
| 参数             | 默认值       | 说明                          |
|------------------|-------------|-------------------------------|
| `left_eye_path`  | 见文件       | 左眼瞳孔模型路径（点分隔层级）|
| `sensitivity`    | 35          | 灵敏度系数（建议20-50）       |
| `debug_mode`     | false       | 调试模式输出实时数据          |

### 常见错误
- **路径解析失败**：检查模型层级是否匹配，确认部件在Blockbench中可见。
- **头部部件未找到**：确保 `head_part` 名称与 bbmodel 注册名一致。

---

<!-- English Version -->
## English Version

### Introduction
This Lua API enables dynamic eye tracking for Figura-blockbench models. It automatically adjusts pupil positions based on head rotation angles.

### Installation
1. Place `eye_tracking_api.lua` in your script directory.
2. Call the API in `script.lua` with your configuration.

### Quick Start
```lua
local eyeTracking = require("eye_tracking_api")

eyeTracking.init({
    left_eye_path  = "model.root.Head.LeftEye.Pupil", -- Left eye path
    right_eye_path = "model.root.Head.RightEye.Pupil", -- Right eye path
    head_part      = "Head", -- Name of the head part
    sensitivity    = 35,     -- Sensitivity (higher = slower response)
    debug_mode     = true    -- Enable debug output
})
```

### Configuration
| Parameter        | Default     | Description                      |
|------------------|-------------|----------------------------------|
| `left_eye_path`  | See file    | Dot-separated model path         |
| `sensitivity`    | 35          | Sensitivity coefficient (20-50) |
| `debug_mode`     | false       | Print real-time data if true     |

### Troubleshooting
- **Path Resolution Failed**: Verify model hierarchy in Blockbench.
- **Head Part Missing**: Ensure bbmodel matches the name in bbmodel.

---

<!-- 日本語版 -->
## 日本語版

### 概要
Figura-blockbenchモデル向けの眼球追跡APIです。頭部の回転角度に基づき瞳孔の水平オフセットを自動調整します。

### インストール
1. `eye_tracking_api.lua` をスクリプトディレクトリに配置。
2. `script.lua` でAPIを呼び出し設定します。

### クイックスタート
```lua
local eyeTracking = require("eye_tracking_api")

eyeTracking.init({
    left_eye_path  = "model.root.Head.LeftEye.Pupil", -- 左目のパス
    right_eye_path = "model.root.Head.RightEye.Pupil", -- 右目のパス
    head_part      = "Head", -- 頭部パーツ名
    sensitivity    = 35,     -- 感度（高いほど反応が遅い）
    debug_mode     = true    -- デバッグモード有効化
})
```

### 設定項目
| パラメータ        | 初期値      | 説明                          |
|-------------------|------------|-------------------------------|
| `left_eye_path`   | ファイル参照 | ドット区切りのモデルパス      |
| `sensitivity`     | 35         | 感度係数（推奨20-50）         |
| `debug_mode`      | false      | リアルタイムデータを出力      |

### エラー対処
- **パス解決失敗**: Blockbench内のモデル階層を確認。
- **頭部パーツ不存在**: `head_part` が bbmodel の登録名と一致するか確認。

---

## License | 许可证 | ライセンス
MIT License. 無保証。自由に改変・再配布可能。
```
