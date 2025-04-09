# Eye Tracking System - Pupil Offset Control Script

## Overview
This script implements dynamic pupil offset based on head rotation, calculates pupil positions using Y-axis rotation in model coordinates, and supports debug mode data output.

## Core Features
1. **Dynamic Pupil Tracking**: Real-time pupil position calculation based on head rotation
2. **Sensitivity Control**: Adjustable response sensitivity via normalization coefficient
3. **Position Clamping**: Ensures pupil offset stays within defined limits
4. **Debug Mode**: Real-time output of key parameters and coordinates

## Key Parameters
| Parameter Name         | Description                          | Default |
|-----------------------|-------------------------------------|--------|
| PUPIL_UPDATE_INTERVAL | Position update interval (game ticks) | 2      |
| MAX_PUPIL_OFFSET      | Maximum pupil offset (block units)   | 0.5    |
| Sensitivity Factor    | Rotation normalization coefficient   | 35     |
| DEBUG_MODE            | Debug mode toggle                   | true   |

## Usage Instructions
1. Attach script to the target model
2. Adjust parameters as needed:
   - Modify `MAX_PUPIL_OFFSET` for maximum movement range
   - Adjust sensitivity factor to change response speed
3. Toggle `DEBUG_MODE` for development insights

## Notes
- Verify model path matches `lefteye/righteye` specifications
- Coordinate sensitivity factor with MAX_PUPIL_OFFSET for optimal results
- Disable debug mode in production for performance improvement
