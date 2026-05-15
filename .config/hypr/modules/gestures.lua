hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", mods = "ALT", action = "close" })
hl.gesture({ fingers = 3, direction = "up", mods = "SUPER", scale = 1.5, action = "fullscreen" })
-- hl.gesture({ fingers = 3, direction = "left", scale = 1.5, action = "float" })

-- curson zoom
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = "2" })
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = "1.2", mode = "mult" })
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = "1", mode = "live" })

-- Run a lua lambda function, open a terminal with a 4-finger swipe up:

hl.gesture({ fingers = 4, direction = "up", action = function() hl.exec_cmd("kitty") end })

-- Toggle a special workspace with a 4-finger swipe down, only when holding SUPER, bypassing inhibitors:

hl.gesture({ fingers = 4, direction = "down", mods = "SUPER", action = "special", workspace_name = "scratchpad", disable_inhibit = true })

-- Zoom into the cursor with a pinch, using a multiplier instead of a fixed zoom level:

hl.gesture({ fingers = 2, direction = "pinchin", action = "cursorZoom", zoom_level = "2.0", mode = "mult" })
